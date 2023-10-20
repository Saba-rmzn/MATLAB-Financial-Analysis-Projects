Clear
clc
F=100;
T=[1 1/2,1/4,1/12,1/52,1/365]';
B=100./(1.058.^T); %Selecting “B” so that EAR=0.058
k=size(T,1);
result=zeros(k,4);
for i=1:k
    [rf,EAR,APR,rcc]=ZCR(F,B(i,1),T(i,1));
    result(i,:)=[rf,EAR,APR,rcc];
end
result