% Gauss-Jordan
% Resuelve ecuaciones lineales por Gauss Jordan
% Alejandra Coeto
clear
clc

% Matrices
n = input("Ingresa la cantidad de variables: ");
A = zeros(n,n);
B = zeros(n,1);
C = zeros(n,1);


% Completar la matriz A
for f = 1:n 
    for c = 1:n
        A(f,c) = input("Ingresa el coeficiente ("  + f + ", " + c + "): ");
    end
end

% Completar la matriz B
for f = 1:n
    B(f,1) = input("Ingresa el término independiente " + f + ": ");
end

%% Otro método 
 X = rref([A,B]);
 disp(X)

%% Método de la inversa
disp("Método de matrices----------------------")
C = inv(A)*B;
disp(C)

%% Triángulo inferior

for r = 1: n                                        %Se usan 2 for para recorrer los espacios de la matriz
    for c = 1:n
        if (r == c)                                 %Solo para la diagonal
            factor = 1/A(r,c);                      %Se busca el factor para que al multiplicar los valores de 1
            for k = 1:n                             %Este se obtiene dividiéndolo entre sí mismo
                A(r,k) = A(r,k)*factor;             %Multiplica toda la fila de A por el factor
            end
            B(r,1) = B(r,1)*factor; 
                                                    %También se multiplica la fila de la matriz B
        elseif (r > c)
            factor = A(r,c)*-1;                     %Para el tríangulo el factor se obtiene multiplicando el valor por -1
            for k = 1:n
                A(r,k) = A(r,k) + A(c,k)*factor;    %Se cambian los valores de la fila en A
            end
            B(r,1) = B(r,1) + B(c,1)*factor;        %Se cambian los valores de la fila en B
        end
        

    end
end

disp("Triangulo inferior")
disp(A)

% Triangulo superior
for r = n-1: -1: 1                                  %Se repite el proceso anterior
    for c = r+1:n                                   
        factor = -A(r,c);                           %Se define el factor 

        for k=1:n
         A(r,k) = A(r,k) + A(c,k)*factor;           %Al valor actual, se le suma la multiplicación del número debajo por el factor
        end
         B(r,1) = B(r,1) + B(c,1)*factor;           %Se repite lo mismo para B
            
    end
end

%% Display resultados
disp(A)
disp("Método Gauss-Jordan: ")
disp(B)


