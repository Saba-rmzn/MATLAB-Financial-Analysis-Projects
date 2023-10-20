function ACP=BlackApprox(S0,K,T,Rf,Sigma,Div,DivT)
DisDiv1=sum(Div.*exp(-Rf*DivT));
DisDiv2=sum(Div(1:end-1,1).*exp(-Rf*DivT(1:end-1,1)));
[ACP1,~]=BSOptPrice(S0-DisDiv1,K,T,Rf,Sigma);
[ACP2,~]=BSOptPrice(S0-DisDiv2,K,max(DivT),Rf,Sigma);
ACP=max(ACP1,ACP2);