function [RetVaR SSVaR SCVaR r]=ParVaR(S,p,T)
k=size(S,1);
r=zeros(k-T,1);
for i=1:k-T
    r(i,1)=log(S(i+T,1)/S(i,1));
end
Mu=mean(r);
Sigma=std(r);
RetVaR=norminv(p,Mu,Sigma);
S0=S(end,1);
SSVaR=-S0*(RetVaR);
SCVaR=-S0*(exp(RetVaR)-1);