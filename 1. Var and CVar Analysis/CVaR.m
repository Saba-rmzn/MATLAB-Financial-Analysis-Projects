function [ParCVaR HistCVaR MCSimCVaR]=CVaR(S,p,T)
[~ , ~, ~, Parr]=ParVaR(S,p,T);
[HistRetVaR , ~, ~, Histr]=HistVaR(S,p,T);
[MCSimRetVaR , ~, ~,MCSimr]=MCSimVaR(S,p,T);
ParCVaR=-(mean(Parr)+std(Parr)*normpdf(norminv(p))/p);
HistCVaR=mean(Histr(Histr<HistRetVaR));
MCSimCVaR=mean(MCSimr(MCSimr<MCSimRetVaR));