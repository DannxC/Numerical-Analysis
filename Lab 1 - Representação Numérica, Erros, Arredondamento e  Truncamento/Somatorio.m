n = input('Coloque o valor de n: ');
x = input('Coloque o valor de x: ');

D = 10000;

for i = 1:n
    D = D - x;
end

disp(D);