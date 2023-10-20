function Vsimr=Vsimulation(T,dt,params,r0)
Vbeta=params(1);
Valpha=params(2);
Vsigma=params(3);
Vsimr=zeros(T,1);
Vsimr(1)=r0;
b=exp(-Vbeta*dt);
c=Valpha*(1-exp(-Vbeta*dt));
Vdelta=Vsigma*sqrt((1-exp(-2*Vbeta*dt))/(2*Vbeta));
for i=2:T
    Vsimr(i)=c+b*Vsimr(i-1)+Vdelta*randn(1);
end