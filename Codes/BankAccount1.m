function M=BankAccount1(M0,t,rf)
Mt=zeros(t,1);
Mt(1)=M0*rf+M0;
for i=2:t
    dMt=Mt(i-1)*rf;
    Mt(i)=Mt(i-1)+dMt;
end
M=Mt(end);