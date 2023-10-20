clc
clear
K=100;
Rf=.1;
Sigma=.2;
N=200;
ECP_S=zeros(N+1,1);
EPP_S=zeros(N+1,1);
%% Effect of underling stock price at a fixed time to expiry
S0=0;
for i=0:N
    S0=S0+1;
    [ECP_S(i+1,1),EPP_S(i+1,1)]=BSOptPrice(S0,K,1,Rf,Sigma);
end
subplot(3,2,1)
plot(ECP_S)
axis([0 200 -inf inf])
title('Call-S')
subplot(3,2,2)
plot(EPP_S)
axis([0 200 -inf inf])
title('Put-S')
%% Effect of time to expiry at a fixed underling stock price
% for example for a at-the-money option)
ECP_t=zeros(N+1,1);
EPP_t=zeros(N+1,1);
t=zeros(N+1,1);
S0=K;
T=1;
Deltat=T/N;
for j=0:N
    t(j+1,1)=j*Deltat;
    if t(j+1,1)==T
        ECP_t(j+1,1)=max(S0-K,0);
        EPP_t(j+1,1)=max(K-S0,0);
    else
        [ECP_t(j+1,1),EPP_t(j+1,1)]=BSOptPrice(S0,K,T-t(j+1,1),Rf,Sigma);
    end
end
subplot(3,2,3)
plot(t,ECP_t)
title('Call-t')
subplot(3,2,4)
plot(t,EPP_t)
title('Put-t')
%% Effect of underling stock price and time to expiry
[S0,t]=meshgrid(0:N,0:Deltat:T);
ECP_S_t=zeros(N+1,N+1);
EPP_S_t=zeros(N+1,N+1);
for i=0:N
    for j=0:N
        [ECP_S_t(i+1,j+1),EPP_S_t(i+1,j+1)]=BSOptPrice(S0(i+1,j+1),K,t(i+1,j+1),Rf,Sigma);
    end
end
subplot(3,2,5)
mesh(S0,t,ECP_S_t)
colormap(colorcube(7))
title('Call- S & t')
subplot(3,2,6)
mesh(S0,t,EPP_S_t)
colormap(colorcube(7))
title('Put- S & t')