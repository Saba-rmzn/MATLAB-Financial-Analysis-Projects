% Saba Ramezazni 
% Calculating The VaR (Historical) - Daily Automobile Index Data


S = xlsread('DailyIndexAuto.xlsx'); 
p = 0.05; 
T = 1,
[RetVaR, SSVaR, SCVaR, r] = HistVaR(S,p,T);