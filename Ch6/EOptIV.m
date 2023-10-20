function ECIV=EOptIV(CP,S0,K,T,Rf,Sigma0,Err,Maxitr)
k=1;
ECIV=Sigma0;
[CV,~]=BSOptPrice(S0,K,T,Rf,ECIV);
dV=CV-CP;
while abs(dV)>Err
    [ECGreeks,~]=OptGreeks(S0,K,T,Rf,ECIV);
    Vega=ECGreeks(4);
    ECIV=ECIV-dV/Vega;
    [CV,~]=BSOptPrice(S0,K,T,Rf,ECIV);
    dV=CV-CP;
    k=k+1;
    if k==Maxitr
        disp('Exiting MaxIterations')
        break
    end
end
end