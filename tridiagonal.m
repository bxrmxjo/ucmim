%Se pedirán las diagonales y subdiagonales, comprobando que dichas
%subdiagonales tengan la longitud correcta.

b = input('Introduce la diagonal de tu matriz A entre []: ');
n = length(b);
t = true;
while t == true
    c = input('Introduce la subdiagonal superior  de tu matriz A entre []: ');
    if length(c) == n-1
        t = false;
    else
        disp("Los datos introducidos tienen longitud incorrecta.")
    end
end
r = true;
while r == true
    a = input('Introduce la subdiagonal inferior de tu matriz A entre []: ');
    if length(a) == n-1
        r = false;
    else
        disp("Los datos introducidos tienen longitud incorrecta.")
    end
end

%Se calculan, mediante las fórmulas del ej7 de la hoja 3, los vectores m y
%g, que determinarán las soluciones del sistema a solucionar.

m = zeros(n,1);


m(1) = b(1);
for i=2:n
    m(i) = b(i) - (c(i-1)/m(i-1))*a(i-1);
end



flag = 1;
while flag == 1
    d = input('Introduce tu vector "b" entre [ ], para resolver el sistema Au=b: \n');
    g = zeros(n,1);

    g(1) = d(1)/m(1);
    for i=2:n
        g(i) = (d(i)-g(i-1)*a(i-1))/m(i);
    end

    x = zeros(n,1);

    x(n) = g(n);
    for i=n-1:-1:1
        x(i) = g(i) - (c(i)/m(i))*x(i+1);
    end
    disp(x);
    flag = input('Deseas resolver otro sistema con la misma matriz A?: [Sí: 1 / No: 0] \n');
end

