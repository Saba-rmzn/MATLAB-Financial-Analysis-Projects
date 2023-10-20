function [Er,Sigma,Wstar,Erp,Sigmap]=Portfolioopt(P,m)
r=(P(2:end,:)-P(1:end-1,:))./P(1:end-1,:);
Er=mean(r)';
Sigma=cov(r);
N=length(Er);
e=ones(N,1);
k1=e'*(Sigma^(-1))*Er;
k2=e'*(Sigma^(-1))*e;
k3=Er'*(Sigma^(-1))*Er;
k4=Er'*(Sigma^(-1))*e;
Wstar=zeros(N,m);
Erp=zeros(m,1);
Sigmap=zeros(m,1);
Wstar(:,1)=Sigma^(-1)*e*k2^(-1); 
Erp(1,1)=Wstar(:,1)'*Er;
Sigmap(1,1)=Wstar(:,1)'*Sigma*Wstar(:,1);
Wstar(:,m)=(Er==max(Er));
Erp(m,1)=Wstar(:,m)'*Er;
Sigmap(m,1)=Wstar(:,m)'*Sigma*Wstar(:,m);
selr=linspace(Erp(1,1),Erp(m,1),m);
for i=2:m-1
    Lambda1=k1^(-1)-(selr(i)*k3^(-1)-k1^(-1))*(k1*k3^(-1)-k2*k1^(-1))^(-1)*k2*k1^(-1);
    Lambda2=(selr(i)*k3^(-1)-k1^(-1))*(k1*k3^(-1)-k2*k1^(-1))^(-1);
    Wstar(:,i)=Lambda1*(Sigma^(-1))*Er+Lambda2*(Sigma^(-1))*e;
    Erp(i,1)=Wstar(:,i)'*Er;
    Sigmap(i,1)=Wstar(:,i)'*Sigma*Wstar(:,i);
end