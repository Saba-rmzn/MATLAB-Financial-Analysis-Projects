function D=Dur2(C,F,r,T);
V=0;
D=0;
for t=1:T
    V=C/(1+r(i,1))^i+V;
    D=C*i/(1+r(i,1))^(i+1)+D;
end
V=V+(C+F)/(1+r(T,1))^T;
D=D+(C+F)*T/(1+r(T,1))^(T+1);
D=D/V;