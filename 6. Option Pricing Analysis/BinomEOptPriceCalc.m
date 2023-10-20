% Saba Ramezani 
% Calculating Call Option Price - Binominal Tree Method

% S0: Initial Stock Price
% k: Strike Price
% T: The time to the expiration of the option (in years)
% Rf: The risk-free interest rate
% u: The up-factor
% d: The down-factor
% N: The number of periods in the binomial model

[S, ECP, EPP] = BinomEOptPrice(1409, 800, 0.25, 0.2491, 1.203, 0.831, 2);
