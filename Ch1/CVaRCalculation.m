% Saba Ramezazni 
% Calculating The CVaR (Para,etric, Historical, Monte Carlo Simulation) - Daily Automobile Index Data

S = xlsread('DailyIndexAuto.xlsx'); 
p = 0.05; 
T = 1,
[ParCVaR HistCVaR MCSimCVaR]=CVaR(S,p,T)