function [S,Volat]=HestonSim(T,N,dt,Mu,Gamma,Theta,Kappa,Rho,S0,Volat0)
S=ones(T,N)*S0;
Volat=ones(T,N)*Volat0;
for t=2:T
    Phi1=randn(1,N);
    Phi3=randn(1,N);
    Phi2=Rho*Phi1+sqrt(1-Rho^2)*Phi3;
    dZ1=Phi1*sqrt(dt);
    dZ2=Phi2*sqrt(dt);
    Volat(t,:)=Volat(t-1,:)+(-Gamma*(Volat(t-1,:)-Theta))*dt...
        +Kappa*sqrt(Volat(t-1,:)).*dZ2;
    Volat(t,Volat(t,:)<0)=abs(Volat(t,Volat(t,:)<0));
    S(t,:)=S(t-1,:)+Mu*S(t-1,:)*dt+sqrt(Volat(t-1,:)).*S(t-1,:).*dZ1;
end