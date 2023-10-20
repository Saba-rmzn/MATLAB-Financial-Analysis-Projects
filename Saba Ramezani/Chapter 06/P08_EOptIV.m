% Chapter 06 - EOptIV MATLAB Code (IMplied Volatility - Newton Raphson Method)
% Saba Ramezani 40112442026

function ECallIV = P08_EOptIV(CP, S0, K, T, Rf, Sigma0, Err, Maxitr)

    k = 1;
    ECallIV = Sigma0;
    [CV, ~] = P04_BSOptPrice(S0, K, T, Rf, ECallIV);
    dV = CV - CP;

    while abs(dV) > Err
        [ECGreeks, ~] = P06_OptGreeks(S0, K, T, Rf, ECallIV);

        % Vega
        Vega = ECGreeks(4);
        ECallIV = ECallIV - dV / Vega;
        [CV, ~] = P04_BSOptPrice(S0, K, T, Rf, ECallIV);
        dV = CV - CP;
        k = k + 1;

        % If We Have Reached the Max Number of Iterations, Exit The Loop
        if k == Maxitr
            disp('Reached Max Number of Iterations')
            break
        end
    end
end
