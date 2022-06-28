format long
a = 0;
b = 1;
f =@(x) 2 + 5*x - 3*x.^2 + 6*x.^3 - 7*x.^4 - 3*x.^5 + x.^6;

I = integral(f, a, b);
n = 5;

n_13 = 2;
n_38 = n - n_13;

%partição inicial;... há n(i)+1 pontos (x, f(x))
h = (b - a)/n;
x = [a:h:b];

%aplicação do 1/3 de Simpson nos segmentos designados
Ia1 = 0;
for j = 1:n_13
    Ia1 = Ia1 + h*(f(x(j)) + 4*f(x(j) + h/2) + f(x(j + 1)))/6;
end

%aplicação do 3/8 de Simpson nos segmentos designados
Ia2 = 0;
for j = n_13 + 1:n
    Ia2 = Ia2 + h*(f(x(j)) + 3*f(x(j) + h/3) + 3*f(x(j) + 2*h/3) + f(x(j + 1)))/8;
end

Ia = Ia1 + Ia2;
Et = I - Ia;
fprintf('Para n(1/3 Simpson) = %d e n(3/8 Simpson) = %d:\n\tIa = %.8f\n\tEt = %.8f\n', n_13, n_38, Ia, Et);