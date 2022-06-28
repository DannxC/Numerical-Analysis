format long;
f =@(x) 4*sin(x) - exp(x);
a = 0;
b = 1;
epsilon = 0.00001;
maxIteracoes = input("Coloque o valor do numero maximo de iterações: ");

Bisseccao(f, a, b, epsilon, maxIteracoes);
function[r, k] = Bisseccao(f, a, b, epsilon, maxIteracoes);
k = 0;
while k < maxIteracoes
    r = (a + b) / 2;
    k = k + 1;
    if abs(b - a) <= epsilon
        fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\n', r, k);
        break;
    end
    if f(a) * f(r) > 0
        a = r;
    else
        b = r;
    end
end
if abs(b - a) > epsilon
    fprintf('O valor da raiz aproximada é %.12f, obtido em %d iteracoes.\nNota: Eram necessárias mais iterações.\n', r, k);
end 
end
