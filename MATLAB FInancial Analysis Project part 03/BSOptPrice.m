function [ECP,EPP]=BSOptPrice(S0,K,T,Rf,Sigma)
d1=(log(S0/K)+(Rf+.5*Sigma^2)*T)/(Sigma*sqrt(T));
d2=d1-Sigma*sqrt(T);
Nd1C=normcdf(d1,0,1);
Nd2C=normcdf(d2,0,1);
ECP=S0*Nd1C-K*exp(-Rf*T)*Nd2C;
Nd1P=normcdf(-d1,0,1);
Nd2P=normcdf(-d2,0,1);
EPP=-S0*Nd1P+K*exp(-Rf*T)*Nd2P;