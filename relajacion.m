A = input("Introduce la matriz para resolver el sistema Au = b: ");
b = input("Introduce el segundo miembro (b) del sistema entre []: ");
w = input("Introduce el parámetro de relajación: ");
m = input("Introduce cuál será el número máximo de iteraciones: ");
e = input("Introduce la precisión de parada deseada: ");

n = size(A,1);

r = (sqrt((e^2)/n))*ones(n,1); %para que su módulo sea el mismo que el del error deseado, y se ejecute el bucle while
d = zeros(n,1);
u = zeros(n,1);

k = 0;
while k < m && norm(r) >= e 
    k = k + 1;
    for i=1:n
        r(i) = b(i) - A(i,1:i-1)*u(1:i-1) - A(i,i:n)*u(i:n);
        d(i) = w*(r(i)/A(i,i));
        u(i) = u(i) + d(i);
    end
end

%Se comprueba el motivo de la parada y se devuelve dicho motivo con la información trae consigo.
if k == m
    disp("Se ha alcanzado el número máximo de iteraciones, obteniendo el siguiente resultado: ");
else
    disp(['En ' num2str(k) ' iteraciones se ha obtenido el siguiente resultado :']);
end

disp(u);
