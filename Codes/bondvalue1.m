function bv=bondvalue1(C,F,T,r)
bv=0;
for t=1:T
    bv=bv+C/(1+r)^t;
end
bv=bv+F/(1+r)^T;