function [S_r,T_r,J_A,I_r,M2]=PA(P,Index,rf)
r=price2ret(P);
rm=price2ret(Index);
m_r=mean(r);
m_rm=mean(rm);
c=cov(r,rm);
sigma_r=c(1,1)^.5;
sigma_rm=c(2,2)^.5;
Beta=c(1,2)/c(2,2);
S_r=(m_r-rf)/sigma_r;
T_r=(m_r-rf)/Beta;
J_A=m_r-(rf+(m_rm-rf)*Beta);
I_r=J_A/(std(r-(rf+(rm-rf)*Beta)));
r_P_star=sigma_rm/sigma_r*m_r+(1-sigma_rm/sigma_r)*rf;
M2=r_P_star-m_rm;