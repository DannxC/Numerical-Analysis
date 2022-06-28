format long;
f =@(x) 4*sin(x) - exp(x);
epsilon1 = 0.00001;
epsilon2 = 0.00001;
x0 = 0.5;
x1 = 1;
maxIteracoes = input("Coloque o valor do numero maximo de iteracoes: ");

Secante(f, x0, x1, epsilon1, epsilon2, maxIteracoes);
function[r, k] = Secante(f, x0, x1, epsilon1, epsilon2, maxIteracoes)
k = 0;
tmp = x0;
r = x1;
if abs(f(x0)) <= epsilon1 || abs(f(r)) <= epsilon1 || abs(r - tmp) < epsilon2
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iterações.\n', r, k);
    return;
end
while k < maxIteracoes
    k = k + 1;
    tmp2 = r;
    r = r - (f(r) / (f(r) - f(tmp))) * (r - tmp);
    if abs(f(r)) <= epsilon1 || abs(r - tmp2) <= epsilon2
        fprintf('O valor da raiz aproximada é %.12f, obtido em %d iterações.\n', r, k);
        break;
    end
end
if abs(f(r)) > epsilon1 && abs(r - tmp2) > epsilon2
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\nNota: Eram necessárias mais iterações.\n', r, k);
end
end
