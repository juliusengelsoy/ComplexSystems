c = distinguishable_colors(100);

eps = 0.1;
a = 2;
%b = 1/sqrt(3) + 1/(3*sqrt(3)) - 0.09;
b = 0;

f_dx = @(x, y) (x - x.^3 - y)/eps;
f_dy = @(x, y) a*x - y + b;

lim = 4;
x_min = -lim;
x_max = lim;
x_steps = 20;
y_min = -lim;
y_max = lim;
y_steps = 20;

[X, Y] = meshgrid(linspace(x_min, x_max, x_steps), ...
                linspace(y_min, y_max, y_steps));


DX = f_dx(X, Y);
DY = f_dy(X, Y);

x = linspace(x_min, x_max, 4*x_steps);
y = linspace(y_min, y_max, 4*y_steps);


f = @(t, Y) [f_dx(Y(1), Y(2)); f_dy(Y(1), Y(2))];

th = 0:pi/6:11/6*pi;
r1 = 0.5;
r2 = 3;
r3 = 0.001;
y_start = [r1*cos(th) r2*cos(th) r3*cos(th); ...
            r1*sin(th) r2*sin(th) r3*sin(th)];
s = size(y_start);

figure();
set(gca, 'ColorOrder', c);
hold all;

t_min = 0;
t_max = 50;
for i = 1:s(2)
    [~,ys] = ode45(f,[t_min, t_max],[y_start(2,i);y_start(1,i)]);
    plot(ys(:,1),ys(:,2))
end


quiver(X, Y, DX, DY);
plot(x, x - x.^3);
plot(x, a*x + b);

axis([x_min - 0.1*abs(x_max - x_min) ...
    x_max + 0.1*abs(x_max - x_min) ...
    y_min - 0.1*abs(y_max - y_min) ...
    y_max + 0.1*abs(y_max - y_min)]);
axis equal;

hold off;