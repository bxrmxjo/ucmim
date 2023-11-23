function u = trisup(A,b)
n = size(A,1);
u = (zeros(n,1));
u(n) = b(n)/A(n,n);

for i=n-1:-1:1
    u(i) = (b(i)-(A(i,i+1:n)*u(i+1:n)))/A(i,i);
end