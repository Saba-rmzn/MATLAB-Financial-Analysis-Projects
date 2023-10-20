% Chapter 01 - BMSim MATLAB Code (Creating Brownian Motion)
% Saba Ramezani 40112442026

function brownianMotion = P03_BMSim(totalPathLength, numOfPaths, timeInterval)

    dBrownianMotion = sqrt(timeInterval) * randn(totalPathLength-1, numOfPaths);
    
    brownianMotion = cumsum([zeros(1, numOfPaths); dBrownianMotion]);

end



