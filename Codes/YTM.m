function [r,err]=YTM(C,F,T,P,Ep,Maxitr)
H=1;
L=0;
V=0;
k=1;
while abs(V-P)>Ep
    r=(H+L)/2;
    V=0;
    for i=1:T-1
        V=C/(1+r)^i+V;
    end
    V=V+(C+F)/(1+r)^T;
    if V>P
        L=r;
    else
        H=r;
    end
    k=k+1;
    if k==Maxitr
        disp('Exiting MaxIterations')
        r=(H+L)/2;
        break
    end
end
err=(V-P)/P;
end