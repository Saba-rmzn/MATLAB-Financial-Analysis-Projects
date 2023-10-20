function [ECP,Q,QPrin]=BinomECPrice(S0,K,T,Rf,u,d,N)
Deltat=T/N;
Q=(exp(Rf*Deltat)-d)/(u-d);
QPrin=(u/exp(Rf*Deltat))*Q;
Bino1=0;
Bino2=0;
if log(K/(S0*d^N))/log(u/d)==fix(log(K/(S0*d^N))/log(u/d))
    a=log(K/(S0*d^N))/log(u/d);
else
    a=fix(log(K/(S0*d^N))/log(u/d))+1;
end
if a>N
    ECP=0;
else
    for j=a:N
        Bino1=binopdf(j,N,QPrin)+Bino1;
        Bino2=binopdf(j,N,Q)+Bino2;
    end
    ECP=Bino1*S0-K*exp(-Rf*T)*Bino2;
end