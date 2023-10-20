% Chapter 06 - BlackApprox MATLAB Code (Calculate the Approximate Call Price - Black's Approximation)
% Saba Ramezani 40112442026

function approxCallPrice = P09_BlackApprox(S0, K, Time, Rf, Sigma, dividends, divTime)

    % Discounted Dividends
    discountedDiv1 = sum(dividends .* exp(-Rf * divTime));
    discountedDiv2 = sum(dividends(1:end-1) .* exp(-Rf * divTime(1:end-1)));

    % Call Price - Two Scenarios
    [callPrice1, ~] = P04_BSOptPrice(S0 - discountedDiv1, K, Time, Rf, Sigma);
    [callPrice2, ~] = P04_BSOptPrice(S0 - discountedDiv2, K, max(divTime), Rf, Sigma);

    % Max of The Two Call Prices = The Approximate Call Price
    approxCallPrice = max(callPrice1, callPrice2);

end
