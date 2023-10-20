clc
clear
K=50;
Rf=.1;
Sigma=.2;
[S0,T]=meshgrid(10:100,.1:.1:2);
[N,M]=size(S0);
ECGamma=zeros(N,M);
ECDelta=zeros(N,M);
for i=1:N
    for j=1:M
        [tmp1,tmp2]=OptGreeks(S0(i,j),K,T(i,j),Rf,Sigma);
        ECGamma(i,j)=tmp1(2);
        ECDelta(i,j)=tmp1(1);
    end
end
mesh(S0,T,ECGamma,ECDelta);
xlabel('Stock Price (S)');
ylabel('Time (T)');
zlabel('Gamma');
title('Call Option Price Gamma and Delta Versus S and T');
colorbar('horiz');