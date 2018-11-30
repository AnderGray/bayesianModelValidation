%%%
% A bayesian Validation script
% What we need:
%   1. Main script with uncertain model + uncertain observations
%   2. Distance metric script
%   3. Script for updating 
%%%%
close all, clear variables;

X = [-10:0.01:10];

a=[model1(X)+uncertainty(X).*model1(X);model1(X)-uncertainty(X).*model1(X)];

NPoints=100;

pointFunctions=[1,2,5,10,20,50];

dataLocations = rand(NPoints,1).*20 - 10;
%dataLocations = sort(dataLocations);
randErrors = rand(NPoints,1).*0.3 + 0.1;
randPerturb = (rand(NPoints,1).*2-1)*0.2;

dataVals = model1(dataLocations)+randPerturb.*model1(dataLocations);
dataErrors = model1(dataLocations).*randErrors;




modelVals = model1(dataLocations);
modelErrors = abs(uncertainty(dataLocations).*model1(dataLocations));


for j = 1:length(pointFunctions)
    D = zeros(pointFunctions(j),1);
    YesNo = zeros(pointFunctions(j),1);
    
    for i=1:pointFunctions(j)
        %[model1(dataLocations(i)),uncertainty(dataLocations(i))],[dataVals(i),dataErrors(i)]

        D(i)= areaMetric([modelVals(i),modelErrors(i)],[dataVals(i),dataErrors(i)]);

        if D(i) < modelVals(i)./3
            YesNo(i)=1;
        end
    end

    figure
    histogram(YesNo);


    %s=2;
    %t=0.5;
    a_prior = 1; b_prior = 1;
    %p_theta = @(x) betapdf(x,a_prior,b_prior); 
    %p_thetarnd = @(N) betarnd(a_prior,b_prior,N,1);

    samples_ftheta_anal = betarnd(a_prior+sum(YesNo),b_prior+(length(YesNo)-sum(YesNo)),1000000,1);
    posterior = @(x) betapdf(x,a_prior+sum(YesNo),b_prior+(length(YesNo)-sum(YesNo)));

    %histogram(samples_ftheta_D,50,'Normalization','pdf')
    figure
    histogram(samples_ftheta_anal,50,'Normalization','pdf')
    axis([0 1 0 9])
    title('posterior')
    xlabel('V') 
    ylabel('prob') 
    mean(samples_ftheta_anal)
    std(samples_ftheta_anal)

    scale = [0:0.01:1];
    figure
    plot(scale, posterior(scale))

    figure
    plot(X,model1(X))
    hold on
    %area(X,model1(X)+uncertainty(X).*model1(X));
    fill_between(X, model1(X)+uncertainty(X).*model1(X),model1(X)-uncertainty(X).*model1(X),1,'FaceColor', [0.9 0.9 0.9]);
    errorbar(dataLocations(1:pointFunctions(j)),dataVals(1:pointFunctions(j)),dataErrors(1:pointFunctions(j)),'o');
    title('test function')
    xlabel('input space') 
    ylabel('output space') 

    for i=1:pointFunctions(j)
        if YesNo(i)
            plot(dataLocations(i),dataVals(i),'*');
        end
    end
    hold off
end
   


%figure
%plot(X,uncertainty(X))

%YesNo

function y = model1(x)
    y = ((x-3).^3.*(x+10).^2.*(x+2).^(1).*(x-10))/10^4 +100 ;
    %x.^3+3.*x.^2+4; 
end


function y = uncertainty(x)
    
    y = 0.7.*cos(0.1*x+pi*0.26) + 0.5.*sin(0.3*x);
end
