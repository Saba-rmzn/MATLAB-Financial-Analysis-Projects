% Chapter 01 - CVaR MATLAB Code (Calculate Conditional VaR)
% Saba Ramezani 40112442026

function [ParCVaR, HistCVaR, MCSimCVaR] = P10_CVaR(StockPrices, P, TimePeriod)

    % Parametric VaR 
    [~, ~, ~, ParReturns] = ParVaR(StockPrices, P, TimePeriod);

    % Historical VaR 
    [HistoricalVaR, ~, ~, HistReturns] = HistVaR(StockPrices, P, TimePeriod);

    % Monte Carlo Simulation VaR 
    [MonteCarloSimVaR, ~, ~, MCSimReturns] = MCSimVaR(StockPrices, P, TimePeriod);

 
    ParCVaR = -(mean(ParReturns) + std(ParReturns) * normpdf(norminv(P)) / P);

    HistCVaR = mean(HistReturns(HistReturns < HistoricalVaR));

    MCSimCVaR = mean(MCSimReturns(MCSimReturns < MonteCarloSimVaR));

end
