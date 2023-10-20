% Chapter 01 - Mean & Std MATLAB Code
% Saba Ramezani 40112442026
clc
clear
load DailyTotalIndex1398to1402.mat

% Mean Calculation
M10=(1:10:1000)';
M20=(1:20:1000)';
M50=(1:50:1000)';
M100=(1:100:1000)';
mean1=mean(price2ret(DailyTotalIndex1398to1402));
mean10=mean(price2ret(DailyTotalIndex1398to1402(M10)));
mean20=mean(price2ret(DailyTotalIndex1398to1402(M20)));
mean50=mean(price2ret(DailyTotalIndex1398to1402(M50)));
mean100=mean(price2ret(DailyTotalIndex1398to1402(M100)));

% Standard Deviation Calculation
SD1=std(price2ret(DailyTotalIndex1398to1402));
SD10=std(price2ret(DailyTotalIndex1398to1402(M10)));
SD20=std(price2ret(DailyTotalIndex1398to1402(M20)));
SD50=std(price2ret(DailyTotalIndex1398to1402(M50)));
SD100=std(price2ret(DailyTotalIndex1398to1402(M100)));

results=[mean1 mean10 mean20 mean50 mean100;SD1 SD10 SD20 SD50 SD100];
