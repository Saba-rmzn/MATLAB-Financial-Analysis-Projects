function S=BMSim(T,N,dt)
dS=sqrt(dt)*randn(T-1,N);
S=cumsum([zeros(1,N);dS]);