% Chapter 02 - PA MATLAB Code (Calculation of Portfolio Performance Evaluation Ratios)
% Saba Ramezani 40112442026

function [sharpeRatio, treynorRatio, jensensAlpha, infoRatio, mSquared] = PA(P, Index, riskFreeRate)
    
    assetReturns = price2ret(P);
    marketReturns = price2ret(Index);
    
    % Mean Returns
    meanAssetReturns = mean(assetReturns);
    meanMarketReturns = mean(marketReturns);
    
    % Covariance Matrix 
    covarianceMatrix = cov(assetReturns, marketReturns);
    
    % Standard Deviations 
    SDAssetReturns = sqrt(covarianceMatrix(1, 1));
    SDMarketReturns = sqrt(covarianceMatrix(2, 2));
    
    beta = covarianceMatrix(1, 2) / covarianceMatrix(2, 2);
    
    % Portfolio Performance Evaluation Ratios
    sharpeRatio = (meanAssetReturns - riskFreeRate) / SDAssetReturns;
    
    treynorRatio = (meanAssetReturns - riskFreeRate) / beta;
    
    jensensAlpha = meanAssetReturns - (riskFreeRate + (meanMarketReturns - riskFreeRate) * beta);
    
    infoRatio = jensensAlpha / std(assetReturns - (riskFreeRate + (marketReturns - riskFreeRate) * beta));
    
    % FOr M2:
    optPortfolioReturn = SDMarketReturns / SDAssetReturns * meanAssetReturns + (1 - SDMarketReturns / SDAssetReturns) * riskFreeRate;
  
    mSquared = optPortfolioReturn - meanMarketReturns;

end
