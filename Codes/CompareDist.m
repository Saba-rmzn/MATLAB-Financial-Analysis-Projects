clear
clc
load DailyTotalIndex
r=price2ret(DailyTotalIndex);
k=size(r,1);
Mu=mean(r);
Sigma=std(r);
[N1 X]=hist(r,50);
N2=normpdf(X,Mu,Sigma);
bar(X,N1,'y')
hold on
plot(X,N2,'LineWidth',3)
[H p]=jbtest(r);