format long;
f =@(x) x^10 - 3*x^2 - 2;
g =@(x) -1.004*x^2 + 0.996*x - 2;

x = linspace(-1, 0, 100);
n = length(x);

for i = 1 : n
    a(i) = f(x(i));
end

for i = 1 : n
    b(i) = g(x(i));
end

p = polyfit(x, a, 2);
c = polyval(p, x);

for i = 1 : n
    AError_f_g = abs(a - b);
end
AError_f_g_max = max(AError_f_g);
fprintf('%d\n', AError_f_g_max);

for i = 1 : n
    AError_f_p = abs(a - c);
end
AError_f_p_max = max(AError_f_p);
fprintf('%d\n', AError_f_p_max);

plot(x, a, '*', x, b, x, c);
legend('f(x)','g(x)','p(x)');