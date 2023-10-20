% Chapter 06 - acpbymcsim MATLAB Code (Calculate Asian option Price - Monte Carlo Simulation)
% Saba Ramezani 40112442026

function [avgCallPrice, avgPutPrice] = P10_acpbymcsim (Mu, Sigma, K, S0, Time, Rf, numSteps, numSimulations)

    timeStep = Time / numSteps;

    stockPrice = zeros(numSteps, 1);
    stockPrice(1, 1) = S0;

    tempCallPrices = zeros(numSimulations, 1);
    tempPutPrices = zeros(numSimulations, 1);

    for i = 1:numSimulations

        for j = 2:numSteps
            deltaS = Mu * timeStep * stockPrice(j-1, 1) + Sigma * stockPrice(j-1, 1) .* randn(1) * sqrt(timeStep);
            stockPrice(j, 1) = stockPrice(j-1, 1) + deltaS;
        end

        avgStockPrice = mean(stockPrice);

        tempCallPrices(i, 1) = max(avgStockPrice - K, 0) * exp(-Rf * Time);
        tempPutPrices(i, 1) = max(K - avgStockPrice, 0) * exp(-Rf * Time);

    end

    % Final Average Call and Put Prices - All Simulations
    avgCallPrice = mean(tempCallPrices);
    avgPutPrice = mean(tempPutPrices);

end
