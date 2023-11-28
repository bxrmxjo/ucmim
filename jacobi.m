A = input("Introduce la matriz para resolver el sistema Au = b: ");
b = input("Introduce el segundo miembro (b) del sistema entre []: ");
b = b(:); 
m = input("Introduce cuál será el número máximo de iteraciones: ");
e = input("Introduce la precisión de parada deseada: ");

n = size(A,1);
d = zeros(n,1);
u = zeros(n,1);
r = b - A*u;
nb = norm(b);

k = 0;
while k <= m && norm(r) >= e*nb 
    k = k + 1;

    r = b - A*u;
    d = r./diag(A); %El comando "./" se usa para dividir componente a componente.
    u = u + d;

end

%Al salir del bucle, ya sea por alcanzar las iteraciones máximas o por
%obtener el resultado con la tolerancia deseada, se muestran las
%iteraciones realizadas.

disp(['En ' num2str(k) ' iteraciones se ha obtenido el siguiente resultado :']);
disp(u)
