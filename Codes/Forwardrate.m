function f=Forwardrate(r)
[m, n]=size(r);
f=zeros(m,n);
f(1,:)=r(1,:);
for i=2:m
    f(i,:)=(1+r(i,:)).^i./(1+r(i-1,:)).^(i-1)-1;
end