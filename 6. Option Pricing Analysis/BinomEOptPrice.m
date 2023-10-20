function [S,ECP,EPP]=BinomEOptPrice(S0,K,T,Rf,u,d,N)
Deltat=T/N;
S=nan(N+1,N+1);
S(1,1)=S0;
ECP=nan(N+1,N+1);
EPP=nan(N+1,N+1);
for i=2:N+1
    for j=1:i
        S(j,i)=S0*u^(i-j)*d^(j-1);
    end
end
ECP(:,N+1)=max(S(:,N+1)-K,0);
EPP(:,N+1)=max(K-S(:,N+1),0);
Q=(exp(Rf*Deltat)-d)/(u-d);
for h=N:-1:1
    for l=1:h
        ECP(l,h)=exp(-Rf*Deltat)*(Q*ECP(l,h+1)+(1-Q)*ECP(l+1,h+1));
        EPP(l,h)=exp(-Rf*Deltat)*(Q*EPP(l,h+1)+(1-Q)*EPP(l+1,h+1));
    end
end
ECP=ECP(1,1);
EPP=EPP(1,1);