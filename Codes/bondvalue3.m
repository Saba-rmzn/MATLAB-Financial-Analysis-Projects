function bv=bondvalue3(C,F,T,fun)
bv=0;
for t=1:T
    bv=bv+C/exp(t*fun(t));
end
bv=bv+F/exp(T*fun(t));