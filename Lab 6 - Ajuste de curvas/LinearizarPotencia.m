format long
x = [1 2 3 4 5 6];
y = [1.487 2.958 5.602 8.003 11.452 13.021];
w = log10(x);
z = log10(y);
n = length(x);

soma_w = sum(w);
soma_z = sum(z);
soma_w_quad = sum(w.^2);
soma_wz = sum(w.*z);

w_med = soma_w/n;
z_med = soma_z/n;

%letra a
a1 = (n*soma_wz - soma_w*soma_z)/(n*soma_w_quad - (soma_w)^2);
a0 = z_med - a1*w_med;
fprintf("a1 = %.4f\na0 = %.4f\n\n", a1, a0);

%letra b
alfa = 10^a0;
beta = a1;
fprintf("alfa = %.4f\nbeta = %.4f\n\n", alfa, beta);

%letra c
z1 = a1*w + a0;
y1 = alfa*x.^beta;
St = sum((z - z_med).^2);
Sr = sum((z - a0 - a1*w).^2);
Sy = sqrt(St/(n - 1));
Sy_x = sqrt(Sr/(n - 2));
Cd = (St - Sr)/St;
fprintf("Cd = %.8f\n\n", Cd);

%letra d
r = sqrt(Cd);
fprintf("r = %.7f\n", r);

%letra e
tiledlayout('flow');
nexttile; 
xlabel('logx');
ylabel('logy');
plot(w, z, '*', w, z1);
title('Linearização');
hold on;
nexttile;
xlabel('x');
ylabel('y');
plot(x, y, '*', x, y1);
title('Potência');
hold on;