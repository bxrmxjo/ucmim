function u = trinf1(A,b)
n = size(A,1);
u = zeros(n,1);
u(1) = b(1);
for i=2:n
    u(i) = (b(i)-(A(i,1:i-1)*u(1:i-1)));
end