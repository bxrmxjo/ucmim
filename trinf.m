function u = trinf(A,b) 
n = size(A,1);
u = (zeros(n,1));
u(1) = b(1)/A(1,1);
for i=2:n
    u(i) = (b(i)-((A(i,1:i-1))*u(1:i-1)))/A(i,i);
    
end
