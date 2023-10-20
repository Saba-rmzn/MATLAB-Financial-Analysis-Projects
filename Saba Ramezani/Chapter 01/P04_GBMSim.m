% Chapter 01 - GBMSim MATLAB Code (Creating Geometric brownian Motion)
% Saba Ramezani 40112442026

function simPrice = P04_GBMSim(pathLength, numberOfPaths, timeInterval, drift, volatility, initialPrice)

    simPrice = zeros(pathLength, numberOfPaths);
    
    simPrice(1,:) = initialPrice;
    
    for i = 2:pathLength
        
        dPrice = drift * timeInterval * simPrice(i-1,:) + volatility * simPrice(i-1,:) .* randn(1,numberOfPaths) * sqrt(timeInterval);
        
        simPrice(i,:) = simPrice(i-1,:) + dPrice;
        
    end
end
