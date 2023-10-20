% Chapter 06 - BinomAOptPrice MATLAB Code (Calculating The Price of American Options - Binominal Tree Method)
% Saba Ramezani 40112442026

function [S, ACallP, APutP] = P02_BinomAOptPrice(S0, K, T, Rf, u, d, N)
    DeltaT = T/N; 
    
    S = nan(N+1, N+1);
    ACallP = nan(N+1, N+1);
    APutP = nan(N+1, N+1);
    
    S(1,1) = S0;  


    for i = 2:N+1
        for j = 1:i
            S(j,i) = S0 * u^(i-j) * d^(j-1);
        end
    end

    % Payoff at Maturity
    ACallP(:, N+1) = max(S(:, N+1) - K, 0);
    APutP(:, N+1) = max(K - S(:, N+1), 0);

    % Risk-Neutral Probability
    Q = (exp(Rf * DeltaT) - d) / (u - d);

    
    for h = N:-1:1
        for l = 1:h
            ACallP(l,h) = exp(-Rf * DeltaT) * (Q * ACallP(l, h+1) + (1-Q) * ACallP(l+1, h+1));
            APutP(l,h) = exp(-Rf * DeltaT) * (Q * APutP(l, h+1) + (1-Q) * APutP(l+1, h+1));
            % Early Exercise (If It's Profitable)
            ACallP(l,h) = max(ACallP(l,h), S(l,h) - K);  
            APutP(l,h) = max(APutP(l,h), K - S(l,h));  
        end
    end

    % t=0
    ACallP = ACallP(1,1);
    APutP = APutP(1,1);
end
