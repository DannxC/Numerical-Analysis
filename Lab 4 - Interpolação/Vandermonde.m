x = [-7 -4 -2 1 2];
y = [-1 -3 1 0 0.5];

MVandermonde(x, y);
function MVandermonde(x, y)
n = length(x);
for i = 1 : n
    for j = 1 : n
        A(i, j) = x(i)^(j - 1);
    end
end
b = y';
a = A\b;
for i = 0 : n - 1
    fprintf('a%d = %.5f\n', i, a(i + 1));
end
end