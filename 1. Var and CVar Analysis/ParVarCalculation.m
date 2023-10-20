% Saba Ramezazni
% Calculating The VaR (Parametric) - Daily Automobile Index Data

S = xlsread('DailyIndexAuto.xlsx'); 
p = 0.05; 
T = 1,
[RetVaR, SSVaR, SCVaR, r] = ParVaR(S,p,T);
[RetVaR, SSVaR, SCVaR, r] = HistVaR(S,p,T);
[RetVaR SSVaR SCVaR Simr]=MCSimVaR(S,p,T);

