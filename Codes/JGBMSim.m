function S=JGBMSim(T,N,dt,Mu,Sigma,Lambda,Muy,Sigmay,S0)
r=zeros(T-1,N);
for i=1:N
    for t=1:size(r,1)
        n=poissrnd(Lambda*dt);
        if n~=0
            J=lognrnd(Muy,Sigmay,n,1);
        else
            J=1;
        end
        SumlogJ=sum(log(J));
        r(t,i)=(Mu-0.05*Sigma^2)*dt+Sigma*sqrt(dt)*randn(1)+SumlogJ;
    end
end
S=ret2price(r,S0);