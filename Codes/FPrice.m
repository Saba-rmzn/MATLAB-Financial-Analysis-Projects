function F=FPrice(S0,T,Rf,Div,DivT,q,Rforeign,U,u,y)
DisDiv=sum(Div.*exp(-Rf*DivT));
F=(S0-DisDiv+U)*exp((Rf-q-Rforeign+u-y)*T);