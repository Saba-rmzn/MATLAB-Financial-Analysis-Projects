% Saba Ramezani 
% Calculating Call Option's Implied Volatility 

[ECGreeks,EPGreeks]=OptGreeks(1409,800,0.25,0.2491,0.4768);
Vega=ECGreeks(4);
ECIV=EOptIV(725,1409,800,0.25,0.2491,0.57,0.000001,10000);
