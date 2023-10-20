function [S,ACP,APP]=BinomAOptPrice(S0,K,T,Rf,u,d,N)
Deltat=T/N;
S=nan(N+1,N+1);
S(1,1)=S0;
ACP=nan(N+1,N+1);
APP=nan(N+1,N+1);
for i=2:N+1
    for j=1:i
        S(j,i)=S0*u^(i-j)*d^(j-1);
    end
end
ACP(:,N+1)=max(S(:,N+1)-K,0);
APP(:,N+1)=max(K-S(:,N+1),0);
Q=(exp(Rf*Deltat)-d)/(u-d);
for h=N:-1:1
    for l=1:h
        ACP(l,h)=exp(-Rf*Deltat)*(Q*ACP(l,h+1)+(1-Q)*ACP(l+1,h+1));
        ACP(l,h)=max(ACP(l,h),S(l,h)-K);
        APP(l,h)=exp(-Rf*Deltat)*(Q*APP(l,h+1)+(1-Q)*APP(l+1,h+1));
        APP(l,h)=max(APP(l,h),K-S(l,h));
    end
end
ACP=ACP(1,1);
APP=APP(1,1);