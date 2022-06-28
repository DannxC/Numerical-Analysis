format long;
f =@(x) 1/(1 + 7*x^2);
x = [0, 0.4, 0.65, 1.31, 1.48, 1.62, 2.45];
y = [1, 0.471698, 0.252685, 0.076848, 0.0612265, 0.051624, 0.0232463];
xx(1) = 0.22;
xx(2) = 0.47;
xx(3) = 1.09;
xx(4) = 1.36;
xx(5) = 1.92;

yy(1) = SplineCubicaN(x, y, xx(1));
yy(2) = SplineCubicaN(x, y, xx(2));
yy(3) = SplineCubicaN(x, y, xx(3));
yy(4) = SplineCubicaN(x, y, xx(4));
yy(5) = SplineCubicaN(x, y, xx(5));

%supondo que conhecemos a forma exata da função
for i = 1:5
    yf(i) = f(xx(i));
end
for i = 1:5
	EA(i) = abs(yy(i) - yf(i));
    ER(i) = EA(i)/abs(yf(i));
end

fprintf('Temos que:\n');
for i = 1:5
    fprintf('S3(%.2f) = %f ; f(%.2f) = %f, Erro Relativo: %f\n', xx(i), yy(i), xx(i), yf(i), ER(i));
end

fplot(f, [0, 2.5]);
hold on;
plot(xx, yy, '*');


%Optou-se pela Spline Cubica Natural
function[val] = SplineCubicaN(x, y, xx);
n = length(x) - 1;
m = n - 1;
h = zeros(1, m + 1);
for i = 0:m
    h(i + 1) = x(i + 2) - x(i + 1);
end
A = zeros(n - 1, n - 1);
A(1, 1) = 1;
A(length(x), length(x)) = 1;
for i = 2:n
    for j = 2:n
        if i == j
            A(i, j) = 2*(h(i - 1) + h(i));
            A(i, j - 1) = h(i - 1);
            A(i, j + 1) = h(i);
        end
    end
end
b = zeros(length(x), 1);
for i = 2:n
    b(i, 1) = 6*(((y(i+1)-y(i))/(h(i)))-((y(i)-y(i-1))/(h(i-1))));
end
g = A\b;
%coeficientres ak, bk, ck e dk
for k = 1:length(x) - 1
    ak(k) = (g(k + 1, 1) - g(k))/(6*h(k));
    bk(k) = g(k + 1)/2;
    ck(k) = ((y(k + 1)-y(k))/h(k)) + (2*h(k)*g(k + 1) + g(k)*h(k))/6;
    dk(k) = y(k + 1);
end
i = 1;
while xx > x(i + 1)
    i = i + 1;
end
val= ak(i)*(xx - x(i + 1)).^3 + bk(i)*(xx - x(i + 1)).^2 + ck(i)*(xx - x(i + 1)) + dk(i);
end
