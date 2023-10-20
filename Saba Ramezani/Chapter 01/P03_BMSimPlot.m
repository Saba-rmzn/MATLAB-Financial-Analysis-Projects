% Chapter 01 - BMSim MATLAB Code (Calling the Function + Plot)
% Saba Ramezani 40112442026 

totalPathLength = 100;
numOfPaths = 5;
timeInterval = 1; 

brownianMotion = P03_BMSim(totalPathLength, numOfPaths, timeInterval);

% Plot
figure; 
hold on; 
for i = 1:numOfPaths
    plot(brownianMotion(:,i)); % Plot each path
end

