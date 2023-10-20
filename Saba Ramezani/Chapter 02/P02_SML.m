% Chapter 02 - SML MATLAB Code (Security Market Line Plot)
% Saba Ramezani 40112442026

load MonthlyIndices.mat

numStocks = size(Names, 1);

% For Each Stock
meanReturn = zeros(numStocks-1, 1);
SDReturn = zeros(numStocks-1, 1);
betaReturn = zeros(numStocks-1, 1);
expectedReturn = zeros(numStocks-1, 1);

% Total Market
marketReturn = price2ret(Data.TotalIndex);
meanMarketReturn = mean(marketReturn);
SDMarketReturn = std(marketReturn);

for i = 1:numStocks-1
    
    stockData = eval(['Data.' Names{i}]);
   
    stockReturn = price2ret(stockData);
    meanReturn(i,1) = mean(stockReturn);
    SDReturn(i,1) = std(stockReturn);
    
    % Covariance of The Stock Return & Market Return
    covarianceMatrix = cov(stockReturn, marketReturn);
    
    % The Stock Beta
    betaReturn(i,1) = covarianceMatrix(1,2)/covarianceMatrix(2,2);
    
    % The Stock Return
    expectedReturn(i,1) = rf + (meanMarketReturn - rf) * betaReturn(i,1);
end

% Plot - Beta vs. Expected Return
plot(betaReturn, expectedReturn);

hold on

plot(betaReturn, expectedReturn, 'ko');
plot(betaReturn, meanReturn, '*r')

% Labels
for j = 1:numStocks-1
    text(betaReturn(j, 1), meanReturn(j, 1), ['\leftarrow' Names{j}])
end

% Result
result = [meanReturn, expectedReturn, betaReturn, SDReturn; meanMarketReturn, meanMarketReturn, 1, SDMarketReturn];
