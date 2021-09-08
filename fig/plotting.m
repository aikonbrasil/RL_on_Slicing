close all
clear all

startt = 1
endd = 99

slices_50m = load('50m/se_slices_individualtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
slices_100m = load('100m/se_slices_individualtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
slices_200m = load('200m/se_slices_individualtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
slices_300m = load('300m/se_slices_individualtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');


sumrate_50m = load('50m/sumrateoutputtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
sumrate_100m = load('100m/sumrateoutputtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
sumrate_200m = load('200m/sumrateoutputtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
sumrate_300m = load('300m/sumrateoutputtrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');


interf_50m = load('50m/interferencetrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
interf_100m = load('100m/interferencetrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
interf_200m = load('200m/interferencetrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');
interf_300m = load('300m/interferencetrain_K20_N100_M3_shadow10_episode4-1000_travelIND_fd10_network_0.mat');


% SUM RATE
figure(1)
plot([1:10:3999],sumrate_50m.se_1)
hold on
plot([1:10:3999],sumrate_100m.se_1,'r')
hold on
plot([1:10:3999],sumrate_200m.se_1,'g')
hold on
plot([1:10:3999],sumrate_300m.se_1,'k')
leg = legend('50m','100m','200m','300m');
title(leg,'Maximum Cell Radius')
grid on
xlabel('iterations')
ylabel('Spectral Efficiency (bps/Hz)')
title('Radio Resources Optimization using RL on UAV Scenario')




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



% INTERFERENCE
figure(4)
plot(interf_50m.time_sample,interf_50m.interference)
hold on
plot(interf_100m.time_sample,interf_100m.interference,'r')
hold on
plot(interf_200m.time_sample,interf_200m.interference,'g')
hold on
plot(interf_300m.time_sample,interf_300m.interference,'k')
leg = legend('50m','100m','200m','300m');
title(leg,'Maximum Cell Radius')
grid on
xlabel('iterations')
ylabel('Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')




figure(5)
b=bar([nanmean(interf_50m.interference(startt:end));...
    nanmean(interf_100m.interference(startt:end));...
    nanmean(interf_200m.interference(startt:end));...
    nanmean(interf_300m.interference(startt:end))], 'stacked' );
b.FaceColor='flat'
b.CData(2,:) = [.5 0 .5];
b.CData(3,:) = [0 .5 .5];
b.CData(4,:) = [.5 .3 .0];
xticklabels({'30 m','50 m','100 m','200 m'})

xlabel('Maximum Cell Radius')
ylabel('Mean Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')

figure(6)
c = bar([nanmax(interf_50m.interference(startt:end));...
    nanmax(interf_100m.interference(startt:end));...
    nanmax(interf_200m.interference(startt:end));...
    nanmax(interf_300m.interference(startt:end))], 'stacked' );
c.FaceColor='flat';
c.CData(2,:) = [.5 0 .5];
c.CData(3,:) = [0 .5 .5];
c.CData(4,:) = [.5 .3 .0];
xticklabels({'30 m','50 m','100 m','200 m'})

xlabel('Maximum Cell Radius')
ylabel('Max. Interference (dBm)')
title('Interference Mitigation using RL on UAV Scenario')

