function Con=Conv2(C,F,r,T)
V=0;
Con=0;
for i=1:T-1
    V=C/(1+r(i,1))^i+V;
    Con=((C*i*(i+1))/(1+r(i,1))^i)/(1+r(i,1))^2+Con;
end
V=V+(C+F)/(1+r(T,1))^T;
Con=(((C+F)*T*(T+1))/(1+r(T,1))^T)/(1+r(T,1))^2+Con;
Con=Con/V;