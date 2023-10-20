% Chapter 06 - BSOptPrice MATLAB Code (European Call Price - Black-Scholes Formula)
% Saba Ramezani 40112442026

function [ECallPrice, EPutPrice] = P04_BSOptPrice(S0, k, Time, Rf, sigma)

    d1 = (log(S0 / k) + (Rf + 0.5 * sigma^2) * Time) / (sigma * sqrt(Time));
    d2 = d1 - sigma * sqrt(Time);
    
    % Call Option
    NormD1Call = normcdf(d1, 0, 1);
    NormD2Call = normcdf(d2, 0, 1);
    
    ECallPrice = S0 * NormD1Call - k * exp(-Rf * Time) * NormD2Call;
    
    % Put Option
    NormD1Put = normcdf(-d1, 0, 1);
    NormD2Put = normcdf(-d2, 0, 1);
    
    EPutPrice = -S0 * NormD1Put + k * exp(-Rf * Time) * NormD2Put;
    
end
