% Introduction - Bank Account 01 MATLAB Code
% Saba Ramezani 40112442026

function B = BankAccount01(B0,T,Rf);
Bt=zeros(T,1);
Bt(1)=B0*(1+Rf);
for i=2:T
    dBt=Bt(i-1)*Rf;
    Bt(i)=Bt(i-1)+dBt;
end
B=Bt(end);
