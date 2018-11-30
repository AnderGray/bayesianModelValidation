%%%
%   This script produces plots for showcasing the area metric for the
%   bayesian validation conferance paper
%%%

clear;close all;

% Between two disrtibutions
mean1 = 0;
var1 = 2;

mean2 = 1;
var2 = 1;

x = [-6:0.001:8];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);


figure;
plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'r','LineWidth',2);
fill_between(x,env1,env2,1,'FaceColor', [0.85 0.85 0.85]);
areaMetric([mean1,var1],[mean2,var2])
set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)

hold off

%Between two data points
mean1 = 0;
var1 = 0.0001;

mean2 = 1;
var2 = 0.0001;

x = [-2:0.001:3];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);

figure;
plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'r','LineWidth',2);
fill_between(x,env1,env2,1,'FaceColor', [0.85 0.85 0.85]);
areaMetric([mean1,var1],[mean2,var2])
set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)
hold off

%Between a data point and a distribution
mean1 = 0;
var1 = 2;

mean2 = 1;
var2 = 0.0001;

x = [-6:0.001:8];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);

figure;
plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'r','LineWidth',2);
fill_between(x,env1,env2,1,'FaceColor', [0.85 0.85 0.85]);
areaMetric([mean1,var1],[mean2,var2])
set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)
hold off



%Between a distribution and an imprecise distribution
mean1 = 0;
var1 = 3;

mean2 = 1;
var2 = 1;

mean3 = 2;
var3 = 1;

x = [-6:0.001:8];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);
env3 = normcdf(x,mean3,var3);

figure;
plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'r','LineWidth',2);
plot(x,env3,'r','LineWidth',2);
fill_between(x,env2,env3,1,'FaceColor', [1 0.4157 0.4157]);%0.9686
fill_between(x,env1,env3,1,'FaceColor', [0.85 0.85 0.85]);
set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)
hold off
a1=areaMetric([mean1,var1],[mean2,var2]);
a2=areaMetric([mean1,var1],[mean3,var3]);
a3=areaMetric([mean2,var2],[mean3,var3]);
(a1+a2-a3)/2


%Between a point and an imprecise distribution
mean1 = 0;
var1 = 0.0001;

mean2 = 1;
var2 = 1;

mean3 = 2;
var3 = 1;

x = [-6:0.001:8];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);
env3 = normcdf(x,mean3,var3);
figure;

plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'r','LineWidth',2);
plot(x,env3,'r','LineWidth',2);
fill_between(x,env2,env3,1,'FaceColor', [1 0.4157 0.4157]);%0.9686
fill_between(x,env1,env3,1,'FaceColor', [0.85 0.85 0.85]);
set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)
hold off


a1=areaMetric([mean1,var1],[mean2,var2]);
a2=areaMetric([mean1,var1],[mean3,var3]);
a3=areaMetric([mean2,var2],[mean3,var3]);
(a1+a2-a3)/2



%Between two p-boxes an imprecise distribution
mean1 = 0;
var1 = 0.5;

mean2 = 1;
var2 = 0.5;


mean3 = 1;
var3 = 1;

mean4 = 2;
var4 = 1;

x = [-6:0.001:8];
env1 = normcdf(x,mean1,var1);
env2 = normcdf(x,mean2,var2);
env3 = normcdf(x,mean3,var3);
env4 = normcdf(x,mean4,var4);

figure;

plot(x,env1,'b','LineWidth',2);
hold on
plot(x,env2,'b','LineWidth',2);
plot(x,env3,'r','LineWidth',2);
plot(x,env4,'r','LineWidth',2);

%fill_between(x,env2,env3,1,'FaceColor', [1 0.4157 0.4157]);%0.9686
%fill_between(x,env1,env3,1,'FaceColor', [0.85 0.85 0.85]);

fill_between(x,env1,env3,1,'FaceColor', [0.85 0.85 0.85])
fill_between(x,env2,env4,1,'FaceColor', [0.85 0.85 0.85])
%fill_between(x,env2,env3,1,'FaceColor', [0.85 0.85 0.85])
%fill_between(x,env1,env4,1,'FaceColor', [0.85 0.85 0.85])

set(gca,'FontSize',23)
xlabel('physical units','FontSize',26) 
ylabel('CDF','FontSize',26)
hold off


a1=areaMetric([mean1,var1],[mean3,var3]);
a2=areaMetric([mean2,var2],[mean4,var4]);

a1+a2
