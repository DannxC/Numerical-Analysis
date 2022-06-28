format long;
f =@(x) 4*sin(x) - exp(x);
a = 0;
b = 1;
epsilon1 = 0.00001;
epsilon2 = 0.00001;
maxIteracoes = input("Coloque o valor do numero maximo de iteracoes: ");

FalsePosition(f, a, b, epsilon1, epsilon2, maxIteracoes);
function[r, k] = FalsePosition(f, a, b, epsilon1, epsilon2, maxIteracoes);
k = 0;
while k < maxIteracoes;
    r = (a * f(b) - b * f(a))/(f(b) - f(a));
    k = k + 1;
    yr = f(r);
    if abs(b - a) <= epsilon1 || abs(yr) <= epsilon2
        fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\n', r, k);
        break;
    end
    if f(a) * yr > 0
        a = r;
    else
        b = r;
    end
end
if abs(b - a) > epsilon1 && abs(yr) > epsilon2
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\nNota: Eram necessárias mais iterações.\n', r, k);
end
end