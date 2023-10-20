clear
clc
load Indices
k=size(Names,1);
m_r=zeros(k-1,1);
sigma_r=zeros(k-1,1);
beta_r=zeros(k-1,1);
E_r=zeros(k-1,1);
r_m=price2ret(Data.TotalIndex);
m_rm=mean(r_m);
sigma_rm=std(r_m);
for i=1:k-1
    tmp=eval(['Data.' Names{i}]);
    r_tmp=price2ret(tmp);
    m_r(i,1)=mean(r_tmp);
    sigma_r(i,1)=std(r_tmp);
    c=cov(r_tmp,r_m);
    beta_r(i,1)=c(1,2)/c(2,2);
    E_r(i,1)=rf+(m_rm-rf)*beta_r(i,1);
end
plot(beta_r,E_r);
hold on
plot(beta_r,E_r,'ko');
plot(beta_r,m_r,'*r')
for j=1:k-1
    text(beta_r(j,1),m_r(j,1),['\leftarrow' Names{j}])
end
result=[m_r,E_r,beta_r,sigma_r;m_rm,m_rm,1,sigma_rm];