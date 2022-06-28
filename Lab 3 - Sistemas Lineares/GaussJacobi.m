format long
A = [3 -0.1 -0.2 ; 0.1 7 -0.3 ; 0.3 -0.2 10];
b = [7.85; -19.3; 71.4];
epsilon = 0.0000001;
maxIteracoes = 1000;

[X1, dr, k] = MetodoGaussJacobi(A, b, epsilon, maxIteracoes);
fprintf('O número de iterações é: %d\n', k);
disp('A solução do sistema é: ');
X1
fprintf('O critério de parada foi atendido com: %d\n', dr);

function [X1, dr, k] = MetodoGaussJacobi(A, b, epsilon, maxIteracoes)
ord = size(A);
ord2 = size(b);
for i = 1 : ord2
    X(i, 1) = b(i, 1)/A(i, i);
end
k = 1;
for i = 1 : ord
    for j = 1 : ord
        if i == j
            C(i, j) = 0;
            g(i, 1) = b(i, 1)/A(i, i);
        else
            C(i, j) = -A(i, j)/A(i, i);
        end
    end
end
while k <= maxIteracoes
    X1 = C*X + g;
    for i = 1 : ord;
        deltax(i, 1) = abs(X1(i, 1) - X(i, 1));
    end
    dr = max(abs(deltax))/max(abs(X1));
    if (dr <= epsilon)
        break;
    end
    X = X1;
    k = k + 1;
end
end
