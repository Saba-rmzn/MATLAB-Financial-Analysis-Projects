% Chapter 01 - Random Walk Limit MATLAB Code
% Saba Ramezani 40112442026
clc
clear

% The Variables
num1 = 20;
num2 = 100;
num3 = 5000;
timeEnd = 1;

% The Time Intervals
timeInt1 = 0:1/num1:timeEnd;
timeInt2 = 0:1/num2:timeEnd;
timeInt3 = 0:1/num3:timeEnd;

startVal = 0;

% Random Values and Cummulative Sums
randomVals1 = (2*(rand(num1,1) > .5) - 1) * sqrt(timeEnd/num1);
S1 = cumsum([startVal; randomVals1]);

randomVals2 = (2*(rand(num2,1) > .5) - 1) * sqrt(timeEnd/num2);
S2 = cumsum([startVal; randomVals2]);

randomVals3 = (2*(rand(num3,1) > .5) - 1) * sqrt(timeEnd/num3);
S3 = cumsum([startVal; randomVals3]);

% Plot
plot(timeInt1, S1, timeInt2, S2, timeInt3, S3, timeInt1, zeros(num1+1,1), 'k');
