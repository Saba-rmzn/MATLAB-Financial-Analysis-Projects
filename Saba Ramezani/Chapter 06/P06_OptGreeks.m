% Chapter 06 - OptGreeks MATLAB Code (Effect of Each Variable on The Option Price - Greeks Formulas)
% Saba Ramezani 40112442026

function [ECallGreeks, EPutGreeks] = P06_OptGreeks(S0, K, T, Rf, Sigma)

    % d1 and d2 - Black-Scholes formula
    d1 = (log(S0/K) + (Rf + 0.5 * Sigma^2) * T) / (Sigma * sqrt(T));
    d2 = d1 - Sigma * sqrt(T);

    % Normal distribution values - d1 and d2
    Nd1 = normcdf(d1, 0, 1);
    Nd2 = normcdf(d2, 0, 1);

    Npd1 = normpdf(d1, 0, 1);
    
    Npmd1 = normpdf(-d1, 0, 1);

    Nmd2 = normcdf(-d2, 0, 1);

    % Call Option Greeks
    CDelta = Nd1;
    CGamma = Npd1 / (Sigma * S0 * sqrt(T));
    CTheta = -((Sigma * S0 * Npd1) / (2 * sqrt(T))) - Rf * K * exp(-Rf * T) * Nd2;
    CVega = S0 * sqrt(T) * Npd1;
    CRho = K * T * exp(-Rf * T) * Nd2;

    % Put Option Greeks
    PDelta = Nd1 - 1;
    PGamma = Npd1 / (Sigma * S0 * sqrt(T));
    PTheta = -((Sigma * S0 * Npmd1) / (2 * sqrt(T))) + Rf * K * exp(-Rf * T) * Nmd2;
    PVega = S0 * sqrt(T) * Npd1;
    PRho = -K * T * exp(-Rf * T) * Nmd2;

    
    ECallGreeks = [CDelta; CGamma; CTheta; CVega; CRho];
    EPutGreeks = [PDelta; PGamma; PTheta; PVega; PRho];
    
end
