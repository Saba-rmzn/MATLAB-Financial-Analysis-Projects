function D=Dur(C,F,r,T)
V=0;
D=0;
for i=1:T-1
    V=C/(1+r)^i+V;
    D=C*i/(1+r)^i+D;
end
V=V+(C+F)/(1+r)^T;
D=D+(C+F)*T/(1+r)^T;
D=D/V;