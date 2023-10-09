%Interpolación
% Ejercicio de interpolación
% Alejandra Coeto Sánchez

% Definir coordenadas
x = [1,2,3,4,5,6,7,8,9,10,11,12,13];
y = [3.5;4;3.5;4;3.5;4;3.5;4;3.5;4;3.5;4;3.5];


plot(x,y,"o")
xlim([0 15])
ylim([0 15])


% Coeficientes
c = vander(x) \ y;
x12 = c(1)
x11 = c(2)
x10 = c(3)
x9 = c(4)
x8 = c(5)
x7 = c(6)
x6 = c(7)
x5 = c(8)
x4 = c(9)
x3 = c(10);
x2 = c(11);
x = c(12);
cte = c(13);

disp("-------------------------")
disp(" Interpolación no lineal ")
disp("-------------------------")
disp("Los coeficientes son: ")
disp("  x^3 = " + x3)
disp("  x^2 = " + x2)
disp("  x = " + x)
disp("  cte = " + cte)


%Gráficas
%plot(x,y,"*r",'LineWidth',3)
hold on

% Función
x_eval = [0:0.01:13];
y_eval = x12*x_eval.^12 + x11*x_eval.^11 + x10*x_eval.^10 + x9*x_eval.^9 +x8*x_eval.^8 + x7*x_eval.^7 + x6*x_eval.^6 + x5*x_eval.^5 + x4*x_eval.^4 + x3*x_eval.^3 + x2*x_eval.^2 + x*x_eval + cte;

%y_func = x12*x_eval^12 + x11*x_eval^11 + x10*x_eval^10 + x9*x_eval^9 +x8*x_eval^8 + x7*x_eval^7 + x6*x_eval^6 + x5*x_eval^5 + x4*x_eval^4 + x3*x_eval^3 + x2*x_eval.^2 + x*x_eval + cte;

p = polyfit(x_eval,y_eval,12)
y1 = polyval(p,x_eval)

plot(x_eval,y1)
plot(x_eval,y_eval)

hold off
xlim([0 15])
ylim([0 15])
zlim([0 15])
[x,y,z] = cylinder(y1)

surf(x,y,z)

%polyfit
%polyval

