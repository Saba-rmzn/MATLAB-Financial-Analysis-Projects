% Chapter 01 - MuSIgmaGBM MATLAB Code (The Effects of Mu and Sigma)
% Saba Ramezani 40112442026 

simPrice1=P04_GBMSim(100,10,1,.01,.05,100);
simPrice2=P04_GBMSim(100,10,1,.01,.02,100);
simPrice3=P04_GBMSim(100,10,1,.001,.002,100);
simPrice4=P04_GBMSim(100,10,1,-.01,.02,100);

% Plots
subplot(2,2,1)
plot(simPrice1)

subplot(2,2,2)
plot(simPrice2)

subplot(2,2,3)
plot(simPrice3)

subplot(2,2,4)
plot(simPrice4)