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


%Si algún elemento de la diagonal de A es 0, no se podrá realizar el método de Jacobi.
diagonal = diag(A);
for i=1:n
    if diagonal(i) == 0
        error("La matriz A no admite método de Jacobi por tener un elemento nulo en su diagonal")
    end
end

k = 0;
while k < m && norm(r) >= e*nb 
    k = k + 1;

    r = b - A*u;
    d = r./diag(A); %El comando "./" se usa para dividir componente a componente.
    u = u + d;

end


%Se comprueba el motivo de la parada y se devuelve dicho motivo con la información trae consigo.
if k == m
    disp("Se ha alcanzado el número máximo de iteraciones, obteniendo el siguiente resultado: ");
else
    disp(['En ' num2str(k) ' iteraciones se ha obtenido el siguiente resultado :']);
end

disp(u);
