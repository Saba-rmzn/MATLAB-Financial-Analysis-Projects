% Saba Ramezazni 
% Calculating The VaR (Monte Carlo Simulation) - Daily Automobile Index Data

S = xlsread('DailyIndexAuto.xlsx'); 
p = 0.05; 
T = 1,
[RetVaR SSVaR SCVaR Simr]=MCSimVaR(S,p,T)