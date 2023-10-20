% Chapter 01 - CompareDist MATLAB Code (Compare Historical & Parametric VaR)
% Saba Ramezani 40112442026
clear
clc

load DailyTotalIndex1398to1402

r = price2ret(DailyTotalIndex1398to1402);

k = size(r, 1);

Mu = mean(r);
Sigma = std(r);

% Histogram 
[N1, X] = hist(r, 50);

N2 = normpdf(X, Mu, Sigma);

% Plot - Bar Chart
bar(X, N1, 'y')

hold on

% Plot - Normal Probability Density Function
plot(X, N2, 'LineWidth', 3)

% Jarque-Bera Test
[H, p] = jbtest(r);
