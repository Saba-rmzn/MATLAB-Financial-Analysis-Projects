function [S,Volat]=NGARCHSim(T,N,dt,Mu,Omega,Alpha,Beta,Gamma,S0)
S=ones(T,N)*S0;
Volat0=Omega/(1 -Alpha-Beta);
Volat=ones(T,N)*Volat0;
for t=2:T
    S(t,:)=S(t-1,:)+Mu*S(t-1,:)*dt+sqrt(Volat(t-1,:)).*S(t-1,:).*randn(1,N)*sqrt(dt);
    Volat(t,:)=Omega+Alpha.*Volat(t-1,:)+...
        Beta.*(sqrt(Volat(t-1,:)*dt).*randn(1,N)-Gamma.*sqrt(Volat(t-1,:))).^2;
end