% Chapter 06 - SandTeffectsonGamma&Delta MATLAB Code (Effect of Stck Price & Time to Maturity on Greeks Formulas - Gamma & Delta)
% Saba Ramezani 40112442026

clc
clear

% Constants
K = 50;                 % Strike price
Rf = 0.1;               % Risk-free rate
Sigma = 0.2;            % Volatility

% Grid - Stock price and Time to Maturity 
[S0, T] = meshgrid(10:100, 0.1:0.1:2);

% S0 & T Matrix
[N, M] = size(S0);

% Matrices - Gamma and Delta
ECallGamma = zeros(N, M);
ECallDelta = zeros(N, M);


for i = 1:N
    for j = 1:M
        [greekValues, ~] = P06_OptGreeks(S0(i,j), K, T(i,j), Rf, Sigma);

        ECallGamma(i,j) = greekValues(2);
        ECallDelta(i,j) = greekValues(1);
    end
end

% Plot 
mesh(S0, T, ECallGamma, ECallDelta);

xlabel('Stock Price (S0)');
ylabel('Time to Expiry (T)');
zlabel('Gamma');
title('Call Option Price Gamma and Delta - Stock Price and Time to Expiry');

colormap('jet');

colorbar('horiz');
