function bv=bondvalue2(C,F,T,r)
bv=C*(1/r)*(1-1/((1+r)^T))+F/(1+r)^T;