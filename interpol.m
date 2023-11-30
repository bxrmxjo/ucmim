lista = input("Introduce los puntos de interpolación de partida de la siguiente forma: [x1,f(x1); x2,f(x2);...;xn,f(xn)]: ");

disp("A continuación se le pedirán los puntos (x,f(x)) deseados. Cuando desee comenzar el programa, escriba '0'. ")
flag = 1;
while flag == 1
    
    puntos = input("Introduzca punto [x,f(x)]: ");

    if puntos ~= 0
        lista = [lista; puntos];
    else
        flag = 0;
    end

end
