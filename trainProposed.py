# -*- coding: utf-8 -*-
"""
@author: anonymous
"""
import os
import numpy as np
#import matplotlib.pyplot as plt
import project_backend as pb
import time
import collections
import json
import DDPG

import argparse



def main(args):

    json_file = args.json_file

    
    json_file_policy = args.json_file_PA
    json_file_CS = args.json_file_CS
    num_sim = args.num_sim
    
    with open ('./config/deployment/'+json_file+'.json','r') as f:
        options = json.load(f)
    with open ('./config/policy/'+json_file_policy+'.json','r') as f:
        options_policy = json.load(f)
    with open ('./config/policy/'+json_file_CS+'.json','r') as f:
        options_CS = json.load(f)
        
    if not options_policy['cuda']:
        os.environ["CUDA_VISIBLE_DEVICES"] = "-1"
    import tensorflow as tf
    import random
    
    ## Number of samples
    total_samples = options['simulation']['total_samples']
        
    N = options['simulation']['N']
    # Multi channel scenario, M denotes number of channels.
    if'M' in options['simulation']:
        M = options['simulation']['M']
    else: M = 1
    
    # PFS set to true means that we save log average sum-rate instead of sum-rate
    pfs = False
    if'pfs' in options['simulation']:
        pfs = options['simulation']['pfs']
        beta = 0.01
    
    
    if num_sim == -1:
        num_simulations = options['simulation']['num_simulations']
        simulation = options['simulation']['simulation_index_start']
    else:
        num_simulations = 1
        simulation = num_sim
    
    # simulation parameters
    train_episodes = options['train_episodes']
    mobility_params = options['mobility_params']
    mobility_params['alpha_angle'] = options['mobility_params']['alpha_angle_rad'] * np.pi #radian/sec
    #Some defaults
    Pmax_dB = 38.0-30
    Pmax = np.power(10.0,Pmax_dB/10)
    n0_dB = -114.0-30
    noise_var = np.power(10.0,n0_dB/10)
    # Hyper aprameters
    N_neighbors = options_policy['N_neighbors']
    neightresh = noise_var*options_policy['neightresh']
    
    forcezero = False
    
    for overal_sims in range(simulation,simulation+num_simulations):
        tf.reset_default_graph()
        np.random.seed(100+overal_sims)
        random.seed(100+overal_sims)
        tf.set_random_seed(100+overal_sims)
        
        file_path = './simulations/channel/%s_network%d'%(json_file,overal_sims)
        data = np.load(file_path+'.npz',allow_pickle=True)
        
        H_all = data['arr_1']
        H_all_2 = []
        for i in range(total_samples):
            H_all_2.append(H_all[i]**2)
        
        weights = []        
        
        time_calculating_strategy_takes = []
            
        # # Virtual neighbor placer
        # neighbors_in = collections.deque([],2)
        # neighbors = collections.deque([],2)
    
        # sims_pos_p = np.zeros(N).astype(int) - 1
    
        policy = DDPG.DDPG(options,options_policy,options_CS,N,M,Pmax,noise_var, seed=100+overal_sims)
       
       
        # Start the simulation 2
        # Sum rate for the simulation 1
        sum_rate_distributed_policy = []
        interferencevalue = []
        sum_rate_distributed_policy_perSlice = [] #[[None] * M for _ in range(1)]
        sum_rate_list_distributed_policy = collections.deque([],2)
        # Custom Adding for Slicing Scenario
        interference_list_distributed_policy = collections.deque([], 2)
        # Initial allocation is just random
        p_central = Pmax * np.random.rand(N)
        p_strategy = np.array(p_central) # strategy is a completely different object
        p_strategy_current = np.array(p_strategy)
        
        alpha_central = np.zeros((N,M))
        for k in range(N):
            alpha_central[k,np.random.randint(M)] = 1
    
        alpha_strategy = np.array(alpha_central) # strategy is a completely different object
        alpha_strategy_current = np.array(alpha_strategy)
        
        alpha_int_central = np.where(alpha_central==1)[1].astype(int)
        alpha_int_strategy = np.array(alpha_central) # strategy is a completely different object
        alpha_int_strategy_current = np.array(alpha_int_strategy)
       
        time_calculating_strategy_takes = []
        time_optimization_at_each_slot_takes = []
       
        p_strategy_all=[]
        alpha_strategy_all = []
        alpha_int_strategy_all = []
    
        with tf.Session() as sess:
            sess.run(policy.init)
            policy.initialize_critic_updates(sess) 
            policy.initialize_actor_updates(sess) 
            policy.initialize_DQNupdates(sess)
            # Start iterating voer time slots
            for sim in range (total_samples):
                policy.check_memory_restart(sess,sim)       
                policy.update_handler(sess,sim)
                # save an instance per training episode for testing purposes.
                if(sim %train_episodes['T_train'] == 0):
                    model_destination = ('./simulations/sumrate/policy/%s_%s_%s_network%d_episode%d.ckpt'%(
                            json_file,json_file_policy,json_file_CS,overal_sims,int(float(sim)/train_episodes['T_train']))).replace('[','').replace(']','')
                    policy.save(sess,model_destination)
        
                # If at least one time slot passed to get experience
                if (sim %train_episodes['T_train'] > 49):                    
                    # Each agent picks its strategy.
                    for agent in range (N):
                        # Channel Selection #               
                        current_local_state = policy.local_state(sim,agent,p_strategy_all,alpha_strategy_all,alpha_int_strategy_all,H_all_2,sum_rate_list_distributed_policy,weights) 
                        a_time = time.time()  
                        CSstrategy = policy.CSact(sess,current_local_state,sim)
                        selected_channel = int(CSstrategy)
                        current_singlechannel_state = current_local_state[selected_channel*policy.DDPGnum_input:(selected_channel+1)*policy.DDPGnum_input]
                        # if sim > 1000 and forcezero:
                        #     print('aaa')
                        PAstrategy = policy.PAact(sess,current_singlechannel_state,sim,forcezero=forcezero)
                        time_calculating_strategy_takes.append(time.time()-a_time)
                        
                        if (sim %train_episodes['T_train'] > 50): # Koew, There is prev state to form experience.
                            # sorted_neighbors_criteria = np.log10(H_all_2[sim-1][np.array(neighbors[-1][agent]),agent]/policy.prev_suminterferences[neighbors[-1][agent]])
                            # sorted_neighbors = neighbors[-1][agent][np.argsort(sorted_neighbors_criteria)[::-1]]
                            # if len(sorted_neighbors)>N_neighbors:
                            #     sorted_neighbors = sorted_neighbors[:N_neighbors]
                            # sorted_neighbors = np.append(sorted_neighbors,agent)
                            # sorted_interfereds = np.argsort(H_all_2[sim-1][:,agent,alpha_int_strategy_all[-1][agent]])[::-1]
                            
                            sorted_interfereds_all = np.argsort(H_all_2[sim-1][:,agent,alpha_int_strategy_all[-1][agent]]/policy.prev_suminterferences[:,alpha_int_strategy_all[-1][agent]])[::-1]
                            sorted_interfereds_all = np.delete(sorted_interfereds_all,np.where(sorted_interfereds_all==agent))
                            
                            sorted_interfereds = np.hstack((np.setdiff1d(sorted_interfereds_all,np.where(alpha_strategy_all[-1][:,alpha_int_strategy_all[-1][agent]]==0),assume_unique=True),
                                                            np.setdiff1d(sorted_interfereds_all,np.where(alpha_strategy_all[-1][:,alpha_int_strategy_all[-1][agent]]==1),assume_unique=True)))
                            # current_reward = min(10,max(-10,np.sum(np.multiply(weights[-1][sorted_interfereds_and_agent],sum_rate_list_distributed_policy[-1][sorted_interfereds_and_agent,agent,alpha_int_strategy_all[-1][agent]]))))
                            # if forcezero: sorted_interfereds_and_agent = np.delete(sorted_interfereds,np.where(sorted_interfereds==agent))#[:policy.N_neighbors]
                            # else: sorted_interfereds_and_agent = np.append(np.delete(sorted_interfereds,np.where(sorted_interfereds==agent)),agent)#[:policy.N_neighbors],agent)
                            sorted_interfereds_and_agent = np.append(np.delete(sorted_interfereds,np.where(sorted_interfereds==agent))[:policy.N_neighbors],agent)
                            if not pfs: current_reward = np.sum(np.multiply(weights[-1][sorted_interfereds_and_agent],sum_rate_list_distributed_policy[-1][sorted_interfereds_and_agent,agent,alpha_int_strategy_all[-1][agent]]))
                            # else: current_reward = np.sum(np.multiply(weights[-1][sorted_interfereds_and_agent],sum_rate_list_distributed_policy[-1][sorted_interfereds_and_agent,agent,alpha_int_strategy_all[-1][agent]]))
                            # else: current_reward = min(10,max(-5,np.sum(np.multiply(weights[-1][sorted_interfereds_and_agent],sum_rate_list_distributed_policy[-1][sorted_interfereds_and_agent,agent,alpha_int_strategy_all[-1][agent]]))))
                            else: current_reward = np.sum(np.multiply(weights[-1][sorted_interfereds_and_agent],sum_rate_list_distributed_policy[-1][sorted_interfereds_and_agent,agent,alpha_int_strategy_all[-1][agent]]))
    
                            # if forcezero: current_reward -= max(sum_rate_list_distributed_policy[-1][np.arange(N),np.arange(N),alpha_int_strategy_all[-1]])
                            if forcezero: current_reward -= weights[-1][agent]*sum_rate_list_distributed_policy[-1][agent,agent,alpha_int_strategy_all[-1][agent]]
                            if forcezero: current_reward -= 5
                            # if forcezero:
                            #     for repeat in range(5):
                            #         policy.CSremember(agent,current_local_state,current_reward)
                            #         policy.PAremember(agent,current_local_state[alpha_int_strategy_all[-1][agent]*policy.DDPGnum_input:(alpha_int_strategy_all[-1][agent]+1)*policy.DDPGnum_input],current_reward)
                            # else:                        
                            policy.CSremember(agent,current_local_state,current_reward)
                            policy.PAremember(agent,current_local_state[alpha_int_strategy_all[-1][agent]*policy.DDPGnum_input:(alpha_int_strategy_all[-1][agent]+1)*policy.DDPGnum_input],current_reward)
                            
                        # Only train it once per timeslot agent == 0 ensures that
                        if agent == (N-1): # If there is enough data to create a mini batch
                            a_time = time.time()
                            
                            # TRAIN for a minibatch
                            policy.train(sess,sim)
                            
                            time_optimization_at_each_slot_takes.append(time.time()-a_time)
                        # if sim == 200:
                        #     print('debug')
                        
                        # Pick the action
                        p_strategy[agent] = policy.Pmax * PAstrategy #** 10
                        # p_strategy[agent] = policy.Pmax * np.round(PAstrategy,2) #** 10
                        alpha_strategy[agent,:] = np.zeros(M)
                        alpha_strategy[agent,CSstrategy] = 1
                        alpha_int_strategy[agent] = selected_channel
    
                        # Add current state to the short term memory to observe it during the next state
                        policy.previous_state[agent,:] = current_singlechannel_state
                        policy.previous_action[agent] = PAstrategy
                        policy.DQNprevious_state[agent,:] = current_local_state
                        policy.DQNprevious_action[agent] = CSstrategy
    
                if(sim %train_episodes['T_train'] < 50):
                    p_strategy = np.random.rand(N)
                    alpha_strategy = np.zeros((N,M))
                    for k in range(N):
                        alpha_strategy[k,np.random.randint(M)] = 1
                    alpha_int_strategy = np.where(alpha_strategy==1)[1].astype(int)
                p_strategy_current = np.array(p_strategy)
                alpha_strategy_current = np.array(alpha_strategy)
                alpha_int_strategy_current = np.array(alpha_int_strategy).astype(int)
                for m in range(M):
                    policy.prev_suminterferences[:,m] = np.matmul(H_all_2[sim][:,:,m],alpha_strategy[:,m]*p_strategy) - (H_all_2[sim][:,:,m].diagonal()*alpha_strategy[:,m]*p_strategy) + noise_var
                if M > 1:
                    policy.sorted_channels = np.argsort(H_all_2[sim][np.arange(N),np.arange(N),:]/policy.prev_suminterferences)/float(M)
                # sims_pos_p[np.where(p_strategy_current>0)] = sim
    
                # tmp_neighbors_in = []
                # tmp_neighbors = []
                # for nei_i in range(N):
                #     neigh_tmp_variab = np.where((H_all[sim][nei_i,:]**2)*p_strategy_current>neightresh)
                #     neigh_tmp_variab = np.delete(neigh_tmp_variab,np.where(neigh_tmp_variab[0]==nei_i))
                #     tmp_neighbors_in.append(neigh_tmp_variab)
    
                # for nei_i in range(N):
                #     tmp_neighlist = []
                #     for nei_j in range(N):
                #         if(len(np.where(tmp_neighbors_in[nei_j]==nei_i)[0]) != 0):
                #             tmp_neighlist.append(nei_j)
                #     if (len(tmp_neighlist) == 0 and len(neighbors) >0):
                #         tmp_neighbors.append(np.array(neighbors[-1][nei_i]))
                #     else:
                #         tmp_neighbors.append(np.array(tmp_neighlist))
                # neighbors.append(tmp_neighbors)
                # neighbors_in.append(tmp_neighbors_in)
                # all sumrates in a list
                sum_rate_list_distributed_policy.append(pb.reward_helper(H_all[sim],p_strategy,alpha_strategy,noise_var,Pmax))
                #Added Custom Network Slicing
                interference_list_distributed_policy.append(pb.reward_interf_helper(H_all[sim],p_strategy,alpha_strategy,noise_var,Pmax))
                if not pfs:
                    weights.append(np.array(np.ones(N)))
                    sum_rate_distributed_policy.append(pb.sumrate_multi_weighted_clipped(H_all[sim],p_strategy,alpha_strategy,noise_var,weights[sim]))
                    #Custom ADD by Slicing Scenario
                    interferencevalue.append(
                    pb.sumrate_multi_weighted_clipped_interference(H_all[sim], p_strategy, alpha_strategy, noise_var,
                                                          weights[sim]))
                    sumrate_perslice = pb.sumrate_multi_weighted_clipped_eachslice(H_all[sim],p_strategy,alpha_strategy,noise_var,weights[sim])
                    sum_rate_distributed_policy_perSlice.append(sumrate_perslice)

                else:
                    rates = sum_rate_list_distributed_policy[-1][np.arange(N),np.arange(N),alpha_int_strategy_current]
                    if sim % train_episodes['T_train'] == 0: # Restart
                        average_sum_rate = np.array(rates)
                    else:
                        average_sum_rate = (1.0-beta)*average_sum_rate+beta*np.array(rates)
                    weights.append(np.array([1.0/i for i in average_sum_rate]))
                    sum_rate_distributed_policy.append(np.sum(np.log(average_sum_rate)))
                    #Custom add by Slicing Scenario
                    interference_rates = interference_list_distributed_policy[-1][np.arange(N),np.arange(N),alpha_int_strategy_current]
                    if sim % train_episodes['T_train'] == 0: # Restart
                        average_interference = np.array(interference_rates)
                    else:
                        average_interference = (1.0-beta)*average_interference+beta*np.array(interference_rates)
                    #weights.append(np.array([1.0/i for i in average_sum_rate]))
                    interferencevalue.append(np.sum(np.log(average_interference)))
    
                p_strategy_all.append(p_strategy_current)
                alpha_strategy_all.append(alpha_strategy_current)
                alpha_int_strategy_all.append(alpha_int_strategy_current)
                if(sim%100 == 0):
                    print('Time %d sim %d'%(sim,overal_sims))
                if sum(p_strategy_all[-1]>=0.98*policy.Pmax)==policy.N:
                    print('sim %d all 1'%(sim))
                    forcezero = True
                elif sum(p_strategy_all[-1]<=0.02*policy.Pmax)==policy.N:
                    print('sim %d all 0'%(sim))
                    forcezero = True
                else: forcezero = False
           
            policy.equalize(sess)
            print('Train is over sim %d'%(overal_sims))
    
            model_destination = ('./simulations/sumrate/policy/%s_%s_%s_network%d_episode%d.ckpt'%(
                    json_file,json_file_policy,json_file_CS,overal_sims,int(float(total_samples)/train_episodes['T_train']))).replace('[','').replace(']','')
            policy.save(sess,model_destination)
               
        # End Train Phase
        np_save_path = './simulations/sumrate/train/%s_%s_%s_network%d.ckpt'%(json_file,json_file_policy,json_file_CS,overal_sims)
        print(np_save_path)
        np.savez(np_save_path,options,options_policy,sum_rate_distributed_policy,p_strategy_all,alpha_strategy_all,
                 time_optimization_at_each_slot_takes,time_calculating_strategy_takes,interferencevalue, sum_rate_distributed_policy_perSlice)
    
if __name__ == "__main__":     
    parser = argparse.ArgumentParser(description='give test scenarios.')

    parser.add_argument('--json-file', type=str, default='train_K5_N20_M2_shadow10_episode4-5000_travelIND_fd10',
                        help='json file for the deployment')
    

    
    parser.add_argument('--json-file-PA', type=str, default='ddpg200_100_50',
                       help='json file for the hyperparameters')
    parser.add_argument('--json-file-CS', type=str, default='dqn100_50_50',
                       help='json file for the hyperparameters')
    parser.add_argument('--num-sim', type=int, default=0,
                       help='If set to -1, it uses num_simulations of the json file. If set to positive, it runs one simulation with the given id.')
    
    args = parser.parse_args()

    main(args)
    
    