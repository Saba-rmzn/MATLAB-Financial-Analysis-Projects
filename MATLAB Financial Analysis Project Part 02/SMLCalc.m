clear
clc

% Load .mat file
load('FiveIndustriesMonthlyIndices.mat')

% Define industry names
Names = {'Automobile', 'Chemical', 'Metal', 'RealEstate', 'Cement'};

k = length(Names);
m_r = zeros(k,1);
sigma_r = zeros(k,1);
beta_r = zeros(k,1);
E_r = zeros(k,1);

% Assuming a risk-free rate (for example, 0.01 or 1% annually)
rf = 0.01/12; % Monthly risk-free rate

% Convert MonthlyTotalIndex to returns
r_m = diff(log(MonthlyTotalIndex));
m_rm = mean(r_m);
sigma_rm = std(r_m);

for i = 1:k
    % Convert industry data to returns
    r_tmp = diff(log(eval(Names{i})));
    
    m_r(i,1) = mean(r_tmp);
    sigma_r(i,1) = std(r_tmp);
    c = cov(r_tmp, r_m);
    beta_r(i,1) = c(1,2)/c(2,2);
    E_r(i,1) = rf + (m_rm - rf) * beta_r(i,1);
end

plot(beta_r, E_r, 'ko');
hold on;
plot(beta_r, m_r, '*r');
for j = 1:k
    text(beta_r(j,1), m_r(j,1), ['\leftarrow' Names{j}]);
end

result = [m_r, E_r, beta_r, sigma_r; m_rm, m_rm, 1, sigma_rm];
