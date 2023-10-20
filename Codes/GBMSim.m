function S=GBMSim(T,N,dt,Mu,Sigma,S0)
S=zeros(T,N);
S(1,:)=S0;
for i=2:T
    dS=Mu*dt*S(i-1,:)+Sigma*S(i-1,:).*randn(1,N)*sqrt(dt);
    S(i,:)=S(i-1,:)+dS;
end