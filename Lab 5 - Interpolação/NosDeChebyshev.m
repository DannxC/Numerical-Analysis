format long;
f =@(x) 4/(5 + 2*x^2);
a = -3;
b = 3;

n = 2;
xc = cos(pi*[0:n]/n);
xa = (a + b)/2 - ((b - a)/2)*xc;
for i = 1:n+1
   ya(i) = f(xa(i));
end
p = polyfit(xa, ya, 2);

xb = linspace(-3, 3, 100);
yp = polyval(p, xb);
for i = 1:100
   yf(i) = f(xb(i));
end
tiledlayout('flow');
nexttile;
plot(xb, yf, xb, yp);
legend('f(x)','p(x)');
title('n = 2');

EA = abs(yf - yp);
fprintf('Maior erro absoluto entre os 100 pontos de f(x) e p(x) de grau 2: %.5f\n', max(EA));

for n = 3:10
	xc = cos(pi*[0:n]/n);
    xa = (a + b)/2 - ((b - a)/2)*xc;
    for i = 1:n+1
       ya(i) = f(xa(i));
    end
    p = polyfit(xa, ya, n);
    xb = linspace(-3, 3, 100);
    yp = polyval(p, xb);
    for i = 1:100
       yf(i) = f(xb(i));
    end
    nexttile;
    plot(xb, yf, xb, yp);
    legend('f(x)','p(x)');
    title('n =',n);
end