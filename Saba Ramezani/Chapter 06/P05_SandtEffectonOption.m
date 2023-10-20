% Chapter 06 - SandtEffectonOption MATLAB Code (Effects of Stock Price and Time to Maturity on The Option)
% Saba Ramezani 40112442026

% Constants
K = 100;                % strike price
Rf = 0.1;               % risk-free rate
Sigma = 0.2;            % volatility
N = 200;                % number of steps


ECP_S = zeros(N+1,1);
EPP_S = zeros(N+1,1);
S0 = 0;

% Stock Price
for i = 1:(N+1)
    S0 = S0 + 1;
    [ECP_S(i),EPP_S(i)] = P04_BSOptPrice(S0,K,1,Rf,Sigma);
end

% Plot-Stock Price
subplot(3,2,1)
plot(ECP_S)
title('Call Option - Stock Price')

subplot(3,2,2)
plot(EPP_S)
title('Put Option - Stock Price')

% Time to Maturity 
ECP_t = zeros(N+1,1);
EPP_t = zeros(N+1,1);
t = zeros(N+1,1);

% If strike price = Initial Stock Price
S0 = K;
T = 1;                 
Deltat = T/N;

% Time to Maturity
for j = 1:(N+1)
    t(j) = (j-1) * Deltat;
    if t(j) == T
        ECP_t(j) = max(S0-K,0);
        EPP_t(j) = max(K-S0,0);
    else
        [ECP_t(j),EPP_t(j)] = P04_BSOptPrice(S0,K,T-t(j),Rf,Sigma);
    end
end

% plot-Time to Maturity
subplot(3,2,3)
plot(t, ECP_t)
title('Call Option - Time')

subplot(3,2,4)
plot(t, EPP_t)
title('Put Option - Time')

[S0, t] = meshgrid(0:N, 0:Deltat:T);

ECP_S_t = zeros(N+1,N+1);
EPP_S_t = zeros(N+1,N+1);


% Stock Price and Time to Maturity
for i = 1:(N+1)
    for j = 1:(N+1)
        [ECP_S_t(i,j),EPP_S_t(i,j)] = P04_BSOptPrice(S0(i,j),K,t(i,j),Rf,Sigma);
    end
end


% plot-Stock Price and Time to Maturity
subplot(3,2,5)
mesh(S0, t, ECP_S_t)
title('Call Option - Stock Price & Time')

subplot(3,2,6)
mesh(S0, t, EPP_S_t)
title('Put Option - Stock Price & Time')
