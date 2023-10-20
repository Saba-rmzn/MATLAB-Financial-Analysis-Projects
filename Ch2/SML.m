
clear
clc
load FiveIndustriesMonthlyIndices.mat
Names = {'Automobile', 'Chemical', 'Metal', 'RealEstate', 'Cement'};
MonthlyTotalIndex = [1960457.4; 1533366.5; 1689144.1; 1496200.8; 1408597.9; 1308960; 1355240.9; 1424490.9; 1471898.2; 1539632.2; 1579686.7; 1512219.1; 1367250.3; 1282190.8; 1279393.9; 1318359.7; 1386935.3; 1436357.1; 1386451; 1515548.6; 1311306; 1168664.7; 1154844.7; 1219589.9; 1307707.1; 1238357.4; 1150718; 1439124; 1345301.4; 1412354.7; 1595160.1; 1757229.2; 1916194.1; 1270627.1; 986759.2; 690037];
k=size(Names,1);
m_r=zeros(k-1,1);
sigma_r=zeros(k-1,1);
beta_r=zeros(k-1,1);
E_r=zeros(k-1,1);
r_m=price2ret(MonthlyTotalIndex);
m_rm=mean(r_m);
sigma_rm=std(r_m);
for i=1:k-1
    tmp=eval(['data.' Names{i}]);
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