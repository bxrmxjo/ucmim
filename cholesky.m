%Se pide la primera fila de la matriz para obtener su dimensión.
%Posteriormente, se solicita cada fila de la parte triangular inferior de
%la matriz.

f1 = input('Introduce la primera fila de la matriz simétrica A: ');
n = length(f1);
A = zeros(n,n);
A(1,1) = f1(1);
for i=2:n
    t= true;
    while t == true
        v = input(['Introduce las primeras ' num2str(i) ' componentes de la fila ' num2str(i) ' de la matriz A: ']);
        if length(v) == i
            t = false;
        else
            disp("Los datos introducidos tienen longitud incorrecta.")
        end
    end
    %Creamos la matriz A a partir de los datos obtenidos (ya que A ha de
    %ser simétrica)
    A(i,1:i) = v;
    A(1:i-1,i) = v(1:i-1);
end



flag_cholesky = true;

for i=1:n
    beta = A(i,i)-((A(i,1:i-1)*A(i,1:i-1)'));
    if beta <= 0
        flag_cholesky = false;
        break;
    else
        A(i,i) = sqrt(beta);
        for j=i+1:n
            A(j,i) = (A(i,j)-(A(i,1:i-1)*A(j,1:i-1)'))/A(i,i);
        end
    end
end

if ~flag_cholesky
    error("La matriz A introducida no es definida positiva");
end

flag = 1;
while flag == 1
    b = input('Introduce tu vector "b" entre [ ], para resolver el sistema Au=b: \n');
    w = trinf(A,b);
    u = trisup(A',w);
    disp(u);
    flag = input('Deseas resolver otro sistema con la misma matriz A?: [Sí: 1 / No: 0] \n');
end
