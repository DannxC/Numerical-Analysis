format long
a = 0;
b = 1;
f =@(x) 2 + 5*x - 3*x.^2 + 6*x.^3 - 7*x.^4 - 3*x.^5 + x.^6;

I = integral(f, a, b);
n = [1 4 10];

for i = 1:length(n)
    %partição inicial;... há n(i)+1 pontos (x, f(x))
    h = (b - a)/n(i);
    x = [a:h:b];

    %aplicação do 1/3 de Simpson em cada segmento
    Ia = 0;
    for j = 1:n(i)
        Ia = Ia + h*(f(x(j)) + 4*f((x(j + 1) + x(j))/2) + f(x(j + 1)))/6;
    end

    Et = I - Ia;
    fprintf('Para n = %d:\n\tIa = %.8f\n\tEt = %.8f\n', n(i), Ia, Et);
end