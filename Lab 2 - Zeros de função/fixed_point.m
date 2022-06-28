format long;
f =@(x) 4*sin(x) - exp(x);
phi =@(x) x - 2*sin(x) + 0.5 * exp(x);
epsilon1 = 0.00001;
epsilon2 = 0.00001;
x0 = 0.5;
maxIteracoes = input("Coloque o valor do numero maximo de iteracoes: ");

FixedPoint(f, phi, x0, epsilon1, epsilon2, maxIteracoes);
function[r, k] = FixedPoint(f, phi, x0, epsilon1, epsilon2, maxIteracoes)
k = 0;
r = x0;
tmp = r;
if abs(f(x0)) <= epsilon1
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iterações.\n', x0, k);
    return;
end
while k < maxIteracoes
    k = k + 1;
    tmp = r;
    r = phi(r);
    if abs(f(r)) <= epsilon1 || abs(r - tmp) <= epsilon2
        fprintf('O valor da raiz aproximada é %.12f, obtido em %d iterações.\n', r, k);
        break;
    end
end
if abs(f(r)) > epsilon1 && abs(r - tmp) > epsilon2
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\nNota: Eram necessárias mais iterações.\n', r, k);
end
end
