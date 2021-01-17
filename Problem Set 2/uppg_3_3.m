warning off;
clc;
clear all;

ops = odeset('OutputFcn',@odetpbar);

a = 0.1;
b = 0.1;
no = 5;
c = 20;

f_dx = @(x,y,z) -y - z;
f_dy = @(x,y,z) x + a.*y;
f_dz = @(x,y,z) b + z.*(x - c);

f = @(t, Y) [f_dx(Y(1), Y(2), Y(3)); f_dy(Y(1), Y(2), Y(3)); f_dz(Y(1), Y(2), Y(3))];

t_min = 0;
t_max = 500000;

y0 = [1 1 1];

figure();
[~,ys] = ode45(f,[t_min, t_max], y0, ops);

[peaks, inds] = findpeaks(ys(:,1));

plot(peaks(1:end-1), peaks(2:end), '.');
warning on;