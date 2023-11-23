A = input("Introduce la matriz para resolver el sistema Au = b: ");
b = input("Introduce el segundo miembro (b) del sistema entre []: ");
w = input("Introduce el parámetro de relajación: ");
m = input("Introduce cuál será el número máximo de iteraciones: ");
e = input("Introduce la precisión de parada deseada: ");

n = size(A,1);

r = (sqrt((e^2)/n))*ones(n,1); %para que su módulo sea el mismo que el del error deseado, y se ejecute el bucle while
d = zeros(n,1);
u = zeros(n,1);
v = zeros(n,1); %Se comportará como u^(k+1)

k = 1;
while k <= m && norm(r) >= e 
    for i=1:n
        r(i) = b(i) - A(i,1:i-1)*v(1:i-1) - A(i,i:n)*u(i:n);
        d(i) = w*(r(i)/A(i,i));
        v(i) = u(i) + d(i);
    end
    k = k + 1;
end

disp(['En ' num2str(k-1) ' iteraciones se ha obtenido el siguiente resultado :']);
disp(v)