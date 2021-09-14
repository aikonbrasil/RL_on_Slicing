close all
clear all

startt = 1999
endd = 2999

slices_50m  = load('50m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_75m  = load('75m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_100m = load('100m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_120m = load('120m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_140m = load('140m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_160m = load('160m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_200m = load('200m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_220m = load('220m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_240m = load('240m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_260m = load('260m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_280m = load('280m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
slices_300m = load('300m_30000iter/se_slices_individualtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');


sumrate_50m = load('50m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_75m = load('75m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_100m = load('100m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_120m = load('120m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_140m = load('140m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_160m = load('160m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_200m = load('200m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_220m = load('220m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_240m = load('240m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_260m = load('260m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_280m = load('280m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
sumrate_300m = load('300m_30000iter/sumrateoutputtrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');


interf_50m = load('50m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_75m = load('75m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_100m = load('100m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_120m = load('120m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_140m = load('140m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_160m = load('160m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_200m = load('200m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_220m = load('220m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_240m = load('240m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_260m = load('260m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_280m = load('280m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');
interf_300m = load('300m_30000iter/interferencetrain_K20_N100_M3_shadow10_episode3-10000_travelIND_fd10_network_0.mat');



% SUM RATE
figure(1)
plot([1:10:29999],sumrate_50m.se_1,'b')
hold on
plot([1:10:29999],sumrate_75m.se_1,'r')
hold on
plot([1:10:29999],sumrate_100m.se_1,'g')
hold on
plot([1:10:29999],sumrate_120m.se_1,'k')
hold on

plot([1:10:29999],sumrate_140m.se_1,':b')
hold on
plot([1:10:29999],sumrate_160m.se_1,':r')
hold on
plot([1:10:29999],sumrate_200m.se_1,':g')
hold on
plot([1:10:29999],sumrate_220m.se_1,':k')

plot([1:10:29999],sumrate_240m.se_1,'--b')
hold on
plot([1:10:29999],sumrate_260m.se_1,'--r')
hold on
plot([1:10:29999],sumrate_280m.se_1,'--g')
hold on
plot([1:10:29999],sumrate_300m.se_1,'--k')

leg = legend('50m','75m','100m','120m','140m','160m','200m','220m','240m',...
    '260m','280m', '300m');

%leg = legend('50m','100m','200m','300m');
title(leg,'Maximum Cell Radius')
grid on
xlabel('iterations')
ylabel('Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')



if 0
figure(2)
b=bar([nanmean(sumrate_50m.se_1(startt:endd));...
    nanmean(sumrate_100m.se_1(startt:endd));...
    nanmean(sumrate_200m.se_1(startt:endd));...
    nanmean(sumrate_300m.se_1(startt:endd))], 'stacked' );
b.FaceColor='flat'
b.CData(2,:) = [.5 0 .5];
b.CData(3,:) = [0 .5 .5];
b.CData(4,:) = [.5 .3 .0];
xticklabels({'30 m','50 m','100 m','200 m'})

xlabel('Maximum Cell Radius')
ylabel('Mean Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')
end

figure(2)
b=bar([nanmean(sumrate_50m.se_1(startt:endd));...
    nanmean(sumrate_75m.se_1(startt:endd));...
    nanmean(sumrate_100m.se_1(startt:endd));...
    nanmean(sumrate_120m.se_1(startt:endd));...
    nanmean(sumrate_140m.se_1(startt:endd));...
    nanmean(sumrate_160m.se_1(startt:endd));...
    nanmean(sumrate_200m.se_1(startt:endd));...
    nanmean(sumrate_220m.se_1(startt:endd));...
    nanmean(sumrate_240m.se_1(startt:endd));...
    nanmean(sumrate_260m.se_1(startt:endd));...
    nanmean(sumrate_280m.se_1(startt:endd));...
    nanmean(sumrate_300m.se_1(startt:endd))], 'stacked' );
b.FaceColor='flat'
b.CData(2,:) = [.5 0 .5];
b.CData(3,:) = [.4 .1 .4];
b.CData(4,:) = [.5 .2 .3];
b.CData(5,:) = [.6 .2 .2];
b.CData(6,:) = [.7 .1 .1];
b.CData(7,:) = [.8 .2 .6];
b.CData(8,:) = [.9 .3 .4];
b.CData(9,:) = [.8 .1 .5];
b.CData(10,:) = [.7 .9 .6];
b.CData(11,:) = [.7 .5 .8];
b.CData(12,:) = [.2 .8 .7];
xticklabels({'50 m','75 m','100 m','120 m','140 m','160 m','200 m',...
    '220 m','240 m','260 m','280 m','300 m'})
xtickangle(45)
xlabel('Maximum Cell Radius')
ylabel('Mean Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')

if 0
figure(3)
c = bar([nanmax(sumrate_50m.se_1(startt:endd));...
    nanmax(sumrate_100m.se_1(startt:endd));...
    nanmax(sumrate_200m.se_1(startt:endd));...
    nanmax(sumrate_300m.se_1(startt:endd))]);
c.FaceColor='flat';
c.CData(2,:) = [.5 0 .5];
c.CData(3,:) = [0 .5 .5];
c.CData(4,:) = [.5 .3 .0];
xticklabels({'30 m','50 m','100 m','200 m'})

xlabel('Maximum Cell Radius')
ylabel('Max Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')
end

figure(3)
b=bar([nanmax(sumrate_50m.se_1(startt:endd));...
    nanmax(sumrate_75m.se_1(startt:endd));...
    nanmax(sumrate_100m.se_1(startt:endd));...
    nanmax(sumrate_120m.se_1(startt:endd));...
    nanmax(sumrate_140m.se_1(startt:endd));...
    nanmax(sumrate_160m.se_1(startt:endd));...
    nanmax(sumrate_200m.se_1(startt:endd));...
    nanmax(sumrate_220m.se_1(startt:endd));...
    nanmax(sumrate_240m.se_1(startt:endd));...
    nanmax(sumrate_260m.se_1(startt:endd));...
    nanmax(sumrate_280m.se_1(startt:endd));...
    nanmax(sumrate_300m.se_1(startt:endd))], 'stacked' );
b.FaceColor='flat'
b.CData(2,:) = [.5 0 .5];
b.CData(3,:) = [.4 .1 .4];
b.CData(4,:) = [.5 .2 .3];
b.CData(5,:) = [.6 .2 .2];
b.CData(6,:) = [.7 .1 .1];
b.CData(7,:) = [.8 .2 .6];
b.CData(8,:) = [.9 .3 .4];
b.CData(9,:) = [.8 .1 .5];
b.CData(10,:) = [.7 .9 .6];
b.CData(11,:) = [.7 .5 .8];
b.CData(12,:) = [.2 .8 .7];
xticklabels({'50 m','75 m','100 m','120 m','140 m','160 m','200 m',...
    '220 m','240 m','260 m','280 m','300 m'})
xtickangle(45)
xlabel('Maximum Cell Radius')
ylabel('Mean Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')


% INTERFERENCE
figure(4)
plot(interf_50m.time_sample,interf_50m.interference,'b')
hold on
plot(interf_75m.time_sample,interf_75m.interference,'r')
hold on
plot(interf_100m.time_sample,interf_100m.interference,'g')
hold on
plot(interf_120m.time_sample,interf_120m.interference,'k')
hold on 
plot(interf_140m.time_sample,interf_140m.interference,':b')
hold on
plot(interf_160m.time_sample,interf_160m.interference,':r')
hold on
plot(interf_200m.time_sample,interf_200m.interference,':g')
hold on
plot(interf_220m.time_sample,interf_220m.interference,':k')
hold on
plot(interf_240m.time_sample,interf_240m.interference,'--b')
hold on
plot(interf_260m.time_sample,interf_260m.interference,'--r')
hold on
plot(interf_280m.time_sample,interf_280m.interference,'--g')
hold on
plot(interf_300m.time_sample,interf_300m.interference,'--k')

leg = legend('50m','75m','100m','120m','140m','160m','200m','220m','240m',...
    '260m','280m', '300m');
title(leg,'Maximum Cell Radius')
grid on
xlabel('iterations')
ylabel('Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')




figure(5)
b=bar([nanmean(interf_50m.interference(startt:end));...
    nanmean(interf_75m.interference(startt:end));...
    nanmean(interf_100m.interference(startt:end));...
    nanmean(interf_120m.interference(startt:end));...
    nanmean(interf_140m.interference(startt:end));...
    nanmean(interf_160m.interference(startt:end));...
    nanmean(interf_200m.interference(startt:end));...
    nanmean(interf_220m.interference(startt:end));...
    nanmean(interf_240m.interference(startt:end));...
    nanmean(interf_260m.interference(startt:end));...
    nanmean(interf_280m.interference(startt:end));...
    nanmean(interf_300m.interference(startt:end))], 'stacked' );
b.FaceColor='flat'
b.CData(2,:) = [.5 0 .5];
b.CData(3,:) = [.4 .1 .4];
b.CData(4,:) = [.5 .2 .3];
b.CData(5,:) = [.6 .2 .2];
b.CData(6,:) = [.7 .1 .1];
b.CData(7,:) = [.8 .2 .6];
b.CData(8,:) = [.9 .3 .4];
b.CData(9,:) = [.8 .1 .5];
b.CData(10,:) = [.7 .9 .6];
b.CData(11,:) = [.7 .5 .8];
b.CData(12,:) = [.2 .8 .7];
xticklabels({'50 m','75 m','100 m','120 m','140 m','160 m','200 m',...
    '220 m','240 m','260 m','280 m','300 m'})
xtickangle(45)
set(gca,'xaxisLocation','top')
xlabel('Maximum Cell Radius')
ylabel('Mean Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')

figure(6)
c = bar([nanmax(interf_50m.interference(startt:end));...
    nanmax(interf_75m.interference(startt:end));...
    nanmax(interf_100m.interference(startt:end));...
    nanmax(interf_120m.interference(startt:end));...
    nanmax(interf_140m.interference(startt:end));...
    nanmax(interf_160m.interference(startt:end));...
    nanmax(interf_200m.interference(startt:end));...
    nanmax(interf_220m.interference(startt:end));...
    nanmax(interf_240m.interference(startt:end));...
    nanmax(interf_260m.interference(startt:end));...
    nanmax(interf_280m.interference(startt:end));...
    nanmax(interf_300m.interference(startt:end))], 'stacked' );
c.FaceColor='flat';
c.CData(2,:) = [.5 0 .5];
c.CData(3,:) = [.4 .1 .4];
c.CData(4,:) = [.5 .2 .3];
c.CData(5,:) = [.6 .2 .2];
c.CData(6,:) = [.7 .1 .1];
c.CData(7,:) = [.8 .2 .6];
c.CData(8,:) = [.9 .3 .4];
c.CData(9,:) = [.8 .1 .5];
c.CData(10,:) = [.7 .9 .6];
c.CData(11,:) = [.7 .5 .8];
c.CData(12,:) = [.2 .8 .7];
xticklabels({'50 m','75 m','100 m','120 m','140 m','160 m','200 m',...
    '220 m','240 m','260 m','280 m','300 m'})
xtickangle(45)
set(gca,'xaxisLocation','top')
xlabel('Maximum Cell Radius')
ylabel('Max. Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')

