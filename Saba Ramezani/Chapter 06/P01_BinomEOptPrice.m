% Chapter 06 - BinomEOptPrice MATLAB Code (Calculating The Price of European Options - Binominal Tree Method)
% Saba Ramezani 40112442026


function [S, ECallP, EPutP] = P01_BinomEOptPrice(S0, K, T, Rf, u, d, N)
    DeltaT = T/N;  
    
    S = nan(N+1, N+1);
    ECallP = nan(N+1, N+1);
    EPutP = nan(N+1, N+1);
    
    S(1,1) = S0;  

    
    for i = 2:N+1
        for j = 1:i
            S(j,i) = S0 * u^(i-j) * d^(j-1);
        end
    end

    % Payoff at Maturity
    ECallP(:, N+1) = max(S(:, N+1) - K, 0);
    EPutP(:, N+1) = max(K - S(:, N+1), 0);

    % Risk-Neutral Probability
    Q = (exp(Rf * DeltaT) - d) / (u - d);

    for h = N:-1:1
        for l = 1:h
            ECallP(l,h) = exp(-Rf * DeltaT) * (Q * ECallP(l, h+1) + (1-Q) * ECallP(l+1, h+1));
            EPutP(l,h) = exp(-Rf * DeltaT) * (Q * EPutP(l, h+1) + (1-Q) * EPutP(l+1, h+1));
        end
    end

    % t=0
    ECallP = ECallP(1,1);
    EPutP = EPutP(1,1);
end
