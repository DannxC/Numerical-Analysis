format long
a = 0;
b = 1;
f =@(x) 2 + 5*x - 3*x.^2 + 6*x.^3 - 7*x.^4 - 3*x.^5 + x.^6;

I = integral(f, a, b);
n = [1 4 10];

for i = 1:length(n)
    h = (b - a)/n(i);
    x = [a:h:b];
    y = f(x);
    Ia = trapz(x, y);
    Et = I - Ia;
    fprintf('Para n = %d:\n\tIa = %.8f\n\tEt = %.8f\n', n(i), Ia, Et);
end