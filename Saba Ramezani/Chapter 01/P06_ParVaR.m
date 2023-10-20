% Chapter 01 - ParVar MATLAB Code (Calculating Value at Risk, Parametric)
% Saba Ramezani 40112442026 

function [VaRP, VaRSimple, VaRCC, logReturns] = P06_ParVaR(stockPrices, probability, timePeriod)

    % The Number of Stock Prices
    numStockPrices = size(stockPrices,1);
    
    % log Returns
    logReturns = zeros(numStockPrices - timePeriod,1);

    for index = 1:(numStockPrices - timePeriod)
        logReturns(index,1) = log(stockPrices(index + timePeriod,1) / stockPrices(index,1));
    end
    

    mu = mean(logReturns);
    sigma = std(logReturns);
    
    VaRP = norminv(probability, mu, sigma);
    
    LastStockPrice = stockPrices(end,1);

    VaRSimple = -LastStockPrice * (VaRP);
    VaRCC = -LastStockPrice * (exp(VaRP) - 1);
end
