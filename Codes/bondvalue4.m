function bv=bondvalue4(C,F,T,fun)
bv=0;
for t=1:T
    tmp=quad(fun,0,t);
    bv=bv+C/exp(tmp);
end
bv=bv+F/exp(tmp);