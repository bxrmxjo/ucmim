function x = tridiag(A,d)
    
    n = size(A,1);
    
    %Se calculan, mediante las fórmulas del ej7 de la hoja 3, los vectores m y
    %g, que determinarán las soluciones del sistema a solucionar.
    
    m = zeros(n,1);
    
    
    m(1) = A(1,1);
    for i=2:n
        m(i) = A(i,i) - (A(i-1,i)/m(i-1))*A(i,i-1);
    end
    

    g = zeros(n,1);

    g(1) = d(1)/m(1);
    for i=2:n
        g(i) = (d(i)-g(i-1)*A(i,i-1))/m(i);
    end

    x = zeros(n,1);

    x(n) = g(n);
    for i=n-1:-1:1
        x(i) = g(i) - (A(i,i+1)/m(i))*x(i+1);
    end

end
