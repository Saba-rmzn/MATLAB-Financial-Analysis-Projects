% Chapter 01 - MCSimVaR MATLAB Code (VaR - Monte Carlo Simulation)
% Saba Ramezani 40112442026

function [ReturnVaR, VaRSimple, VaRCC, SimReturns] = P09_MCSimVaR(StockPrices, P, TimePeriod)

    returns = price2ret(StockPrices);

    MReturn = mean(returns);
    SDReturn = std(returns);

    InitialStockPrice = StockPrices(end, 1);

    % Geometric Brownian Motion 
    SimPrices = P04_GBMSim(TimePeriod + 1, 10000, 1, MReturn, SDReturn, InitialStockPrice);

    LastSimPrices = SimPrices(end, :)';

    SimReturns = log(LastSimPrices / InitialStockPrice);

    % Value-at-Risk (VaR)
    ReturnVaR = quantile(SimReturns, P);

    % Simple VaR
    VaRSimple = -InitialStockPrice * (ReturnVaR);

    % Compound VaR
    VaRCC = -InitialStockPrice * (exp(ReturnVaR) - 1);

end
