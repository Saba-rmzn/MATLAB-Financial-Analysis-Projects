% Chapter 06 - BinomECPrice MATLAB Code (European Call Price - Binominal Tree Formula)
% Saba Ramezani 40112442026

function [ECallPrice, Q, Qprim]=P03_BinomECPrice(S0, k, T, Rf, UpM, DownM, Steps)
    TimeStep = T / Steps;
    
    Q = (exp(Rf*TimeStep) - DownM) / (UpM - DownM);
    Qprim = (UpM / exp(Rf * TimeStep)) * Q;
    
    Coefficient1 = 0;
    Coefficient2 = 0;
    
    % Value of 'a'
    if log(k / (S0 * DownM^Steps)) / log(UpM / DownM) == fix(log(k / (S0 * DownM^Steps)) / log(UpM / DownM))
        a = log(k / (S0 * DownM^Steps)) / log(UpM / DownM);
    else
        a = fix(log(k / (S0 * DownM^Steps)) / log(UpM / DownM)) + 1;
    end
    
    % Expected Call Price
    if a > Steps
        ECallPrice = 0;
    else
        for j = a : Steps
            Coefficient1 = binopdf(j, Steps, Qprim) + Coefficient1;
            Coefficient2 = binopdf(j, Steps, Q) + Coefficient2;
        end
        ECallPrice = Coefficient1 * S0 - k * exp(-Rf * T) * Coefficient2;
    end
end
