function Con=Conv(N,C,F,r)
V=0;
Con=0;
for i=1:N-1
    V=C/(1+r)^i+V;
    Con=((C*i*(i+1))/(1+r)^i)/(1+r)^2+Con;
end
V=(C+F)/(1+r)^N+V;
Con=(((C+F)*N*(N+1))/(1+r)^N)/(1+r)^2+Con;
Con=Con/V;