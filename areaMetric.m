%%%
%   This is the area metric function for the bayesian Update
%       inputs are vectors, with the first entry being the mean and other
%       being the variance (assumed gaussian for now)
%%%
function y = areaMetric(Xpredictive,Xobservation)



    pre = makedist('Normal','mu',Xpredictive(1),'sigma',Xpredictive(2));
    obs = makedist('Normal','mu',Xobservation(1),'sigma',Xobservation(2));
    
    preCDF = @(x) pre.icdf(x);
    obsCDF = @(x) obs.icdf(x);
    
    integrand = @(x) abs(preCDF(x)-obsCDF(x));
     
    x = [0.01:0.01:1];
    
%     figure
%     plot(x, preCDF(x))
%     hold on
%     plot(x,obsCDF(x))
%     plot(x, integrand(x))
%     hold off

    %preIntegral = integral(preCDF,0,1);
    %obsIntegral = integral(obsCDF,0,1);
    
    Integral = integral(integrand,0,1);
    %int = @(y) integral(integrand,0,y);
    
    %plot(x,int(x))
    y = Integral;
    
    
    
    
    %pre = @(x) normcdf(x,Xpredictive(1),Xpredictive(2));
    %obs = @(x) normcdf(x,Xobservation(1),Xobservation(2));
    
%     firstPointPre = Xpredictive(1)-Xpredictive(2);
%     CDFPre = pre(firstPointPre);
%     while CDFPre > 0.0001
%         firstPointPre=firstPointPre-0.001;
%         CDFPre = pre(firstPointPre);
%     end
%     
%     firstPointObs = Xobservation(1)-Xobservation(2);
%     CDFObs = obs(firstPointObs);
%     while CDFObs > 0.0001
%         firstPointObs=firstPointObs-0.001;
%         CDFObs = obs(firstPointObs);
%     end
%     
%     y=[firstPointPre,firstPointObs];
    
%     tolerance=0.000001;
%     area = 0;
%     for i=0:tolerance:1
%         y1 = pre()
%         
%         
%     end
%     
    
    


end