A = input('Introduce la matriz A del sistema: ');
n = size(A,1);


for i=1:n
    
    for j=i:n
        A(i,j) = A(i,j) - (A(i,1:i-1)*A(1:i-1,j));
    end
    if A(i,i) == 0
        error("La matriz A introducida no admite factorización LU");
    end
    for j=i+1:n
        A(j,i) = (A(j,i) - A(j,1:i-1)*A(1:i-1,i))/A(i,i);
    end
end


flag = 1;
while flag == 1
    b = input('Introduce tu vector "b" entre [ ], para resolver el sistema Au=b: \n');
    w = trinf1(A,b);
    u = trisup(A,w);
    disp(u);
    flag = input('Deseas resolver otro sistema con la misma matriz A?: [Sí: 1 / No: 0] \n');
end