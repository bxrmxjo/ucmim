A = input("Introduce la matriz para resolver el sistema Au = b: ");
b = input("Introduce el segundo miembro (b) del sistema entre []: ");
m = input("Introduce cuál será el número máximo de iteraciones: ");
e = input("Introduce la precisión de parada deseada: ");

n = size(A,1);

r = (sqrt((e^2)/n))*ones(n,1); %para que su módulo sea el mismo que el del error deseado, y se ejecute el bucle while
d = zeros(n,1);
u = zeros(n,1);

k = 1;
while k <= m && norm(r) >= e 
    for i=1:n
        r(i) = b(i) - (A(i,1:n)*u(1:n));
        d(i) = r(i)/A(i,i);
        u(i) = u(i) + d(i);
    end
    k = k + 1;
end

disp(['En ' num2str(k-1) ' iteraciones se ha obtenido el siguiente resultado :']);
disp(u)