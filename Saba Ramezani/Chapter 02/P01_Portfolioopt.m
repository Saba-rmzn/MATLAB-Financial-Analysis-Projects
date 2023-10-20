% Chapter 02 - Portfolioopt MATLAB Code (Portfolio Optimization)
% Saba Ramezani 40112442026

function [Ereturn, Sigma, Wstar, EreturnP, SigmaP] = P01_Portfolioopt(P, m)

    % Expected Return Matrix
    r = (P(2:end,:) - P(1:end-1,:)) ./ P(1:end-1,:);
    Ereturn = mean(r)';
    
    % Covariance Matrix
    Sigma = cov(r);
    
    N = length(Ereturn);
    
    e = ones(N,1);
    
    % Constants Needed
    k1 = e' * (Sigma^(-1)) * Ereturn;
    k2 = e' * (Sigma^(-1)) * e;
    k3 = Ereturn' * (Sigma^(-1)) * Ereturn;
    k4 = Ereturn' * (Sigma^(-1)) * e;
    
    % Portfolio Matrices
    Wstar = zeros(N, m);
    EreturnP = zeros(m, 1);
    SigmaP = zeros(m, 1);
    
    % Minimum Variance Portfolio
    Wstar(:, 1) = Sigma^(-1) * e * k2^(-1); 
    EreturnP(1, 1) = Wstar(:, 1)' * Ereturn;
    SigmaP(1, 1) = Wstar(:, 1)' * Sigma * Wstar(:, 1);
    
    % Maximum Return Portfolio
    Wstar(:, m) = (Ereturn == max(Ereturn));
    EreturnP(m, 1) = Wstar(:, m)' * Ereturn;
    SigmaP(m, 1) = Wstar(:, m)' * Sigma * Wstar(:, m);
    
    SelectedReturns = linspace(EreturnP(1, 1), EreturnP(m, 1), m);
    
    for i = 2:m-1
        Lambda1 = k1^(-1) - (SelectedReturns(i) * k3^(-1) - k1^(-1)) * (k1 * k3^(-1) - k2 * k1^(-1))^(-1) * k2 * k1^(-1);
        Lambda2 = (SelectedReturns(i) * k3^(-1) - k1^(-1)) * (k1 * k3^(-1) - k2 * k1^(-1))^(-1);
        Wstar(:, i) = Lambda1 * (Sigma^(-1)) * Ereturn + Lambda2 * (Sigma^(-1)) * e;
        EreturnP(i, 1) = Wstar(:, i)' * Ereturn;
        SigmaP(i, 1) = Wstar(:, i)' * Sigma * Wstar(:, i);
    end

end
