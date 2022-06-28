format long
x = [-1 0 2 5 6 9 10];
y = [1 1 0 -1 -2 -5 -18];

TDD(x, y);
function TDD(x, y)
n = length(x);
b = zeros(n, n);
b(:, 1) = y(:);
for j = 2 : n
    for i = 1 : n - j + 1
        b(i, j) = (b(i + 1, j - 1) - b(i, j - 1))/(x(i + j - 1) - x(i));
    end
end
for i = 1 : n
    fprintf('Ordem %d\n', i - 1);
    for j = 1 : n
        fprintf('%d\n', b(j, i));
    end
    n = n - 1;
end
end