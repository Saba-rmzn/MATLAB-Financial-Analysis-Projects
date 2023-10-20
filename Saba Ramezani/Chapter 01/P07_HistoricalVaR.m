% Chapter 01 - HistVar MATLAB Code (Calculating Value at Risk, Historical)
% Saba Ramezani 40112442026

function [VaRP, VaRSimple, VaRCC, logReturns] = P07_HistoricalVaR(stockPrices, probability, timePeriod)

    % The Number of Stock Prices
    numStockPrices = size(stockPrices,1);
    
    % log Returns
    logReturns = zeros(numStockPrices - timePeriod,1);

   
    for index = 1:(numStockPrices - timePeriod)
        logReturns(index,1) = log(stockPrices(index + timePeriod,1) / stockPrices(index,1));
    end
    
    VaRP = quantile(logReturns, probability);
    
    lastStockPrice = stockPrices(end,1);

    VaRSimple = -lastStockPrice * (VaRP);
    VaRCC = -lastStockPrice * (exp(VaRP) - 1);
end
