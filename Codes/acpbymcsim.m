function [acp,app]=acpbymcsim(Mu,Sigma,K,S0,T,R,N,M)
dt=T/N;
S=zeros(N,1);
S(1,1)=S0;
acptmp=zeros(M,1);
apptmp=zeros(M,1);
for i=1:M
    for j=2:N
        dS=Mu*dt*S(j-1,1)+Sigma*S(j-1,1).*randn(1)*sqrt(dt);
        S(j,1)=S(j-1,1)+dS;
    end
    ms=mean(S);
    acptmp(i,1)=max(ms-K,0)*exp(-R*T);
    apptmp(i,1)=max(K-ms,0)*exp(-R*T);
end
acp=mean(acptmp);
app=mean(apptmp);