function [rf,EAR,APR,rcc]=ZCR(F,B,T)
rf=F/B-1;
EAR=(1+rf)^(1/T)-1;
APR=rf/T;
rcc=log(1+EAR);