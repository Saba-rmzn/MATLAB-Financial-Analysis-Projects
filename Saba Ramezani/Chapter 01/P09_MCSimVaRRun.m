% Chapter 01 - MCSimVaR MATLAB Code (Running VaR - Monte Carlo Simulation)
% Saba Ramezani 40112442026

load DailyTotalIndex1398to1402

StockPrices = DailyTotalIndex1398to1402;
P = 0.99;
TimePeriod = 1;

[ReturnVaR, VaRSimple, VaRCC, SimReturns] = P09_MCSimVaR(StockPrices, P, TimePeriod);

disp(ReturnVaR);
disp(VaRSimple);
disp(VaRCC);
disp(SimReturns);
