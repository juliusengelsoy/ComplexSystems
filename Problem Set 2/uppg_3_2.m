warning off;
clc;
clear all;

a = 0.1;
b = 0.1;
c = [1 4 15 20];      % 4:20;

ops = odeset('OutputFcn',@odetpbar);

f_dx = @(x,y,z) -y - z;
f_dy = @(x,y,z) x + a.*y;
f_dz = @(x,y,z,c) b + z.*(x - c);

f = @(t, Y, c) [f_dx(Y(1), Y(2), Y(3)); f_dy(Y(1), Y(2), Y(3)); f_dz(Y(1), Y(2), Y(3), c)];

t_min = 0;
t_max = 10000;

y0 = [1 1 1];

figure();
hold all;
axis equal;

[ts,ys] = ode45(@(t,y) f(t,y,c(4)),[t_min, t_max], y0, ops);
x = ys(:,1);
y = ys(:,2);
z = ys(:,3);
col = ones(size(ys(:,1))).*ts;
surface([x x], [y y], [z z], [col col], ...
        'facecol', 'no', ...
        'edgecol', 'interp', ...
        'linew', 1);

%{
for ii = 1:size(c,2)
    [~,ys] = ode45(@(t,y) f(t,y,c(ii)),[t_min, t_max], y0);
    plot3(ys(:,1), ys(:,2), ys(:,3));
end
%}