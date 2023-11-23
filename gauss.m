A = input('Introduce la matriz A del sistema: ');
n = size(A,1);
punt = 1:n;

for i=1:n-1
    [m,j] = max(abs(A(punt(i:n),i)));
    j = j + i - 1;
    punt([i j]) = punt([j i]);
    if A(punt(i),i) ==0
        disp(A);
        error("La matriz A no es inversible.");
    end
    for t=i+1:n
        A(punt(t),i) = A(punt(t),i)/A(punt(i),i);
        A(punt(t),i+1:n) = A(punt(t),i+1:n) - A(punt(i),i+1:n)*(A(punt(t),i));
    end
end


%A continuación se resuelve un sistema con datos "b".

flag = 1;
while flag == 1
    b = input('Introduce tu vector "b" entre [ ], para resolver el sistema Au=b: \n');
    b = b(:);
    w = (zeros(n,1));
    u = (zeros(n,1));
    
    w(1) = b(punt(1));
    for i=2:n
        w(i) = b(punt(i)) - (A(punt(i),1:i-1)*w(1:i-1));
    end
    
    u(n) = w(n)/A(punt(n),n);
    for i=n-1:-1:1
        u(i) = (1/A(punt(i),i))*(w(i)-(A(punt(i),i+1:n)*u(i+1:n)));
    end

    disp(u)
    flag = input('Deseas resolver otro sistema con la misma matriz A?: [Sí: 1 / No: 0] \n');
end



