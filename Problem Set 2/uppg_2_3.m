close all
clear all
clc

A= 2.3;
gamma = 0.2;
w = 1;
%W = 0.5;
W = w*sqrt(1-2*gamma.^2);

f = @(t,Y) [Y(2); -w.^2*sin(Y(1)) - gamma*Y(2) + A*cos(W*t)];

t_range = [0, 1000];
%t_range = 0:10*pi:5000*pi;
%in_cond = [0 0; 1.8 2.5];
in_cond = [0;1.801];
dom = [-pi, 3*pi; -3, 3];
margin = 0.5;
subs = [30, 15];

xdom = linspace(dom(1,1), dom(1,2), subs(1));
ydom = linspace(dom(2,1), dom(2,2), subs(2));

[X, Y] = meshgrid(xdom, ydom);

U = Y;
V = -sin(X) - 0.2*Y;

fig_1 = figure(1);
axis equal;
hold on;
axis([-1.5 1.5 -1.5 1.5]);

%axis([dom(1, 1)-margin dom(1,2)+margin dom(2, 1)-margin dom(2,2)+margin]);

[ts, ys] = ode45(f, t_range, in_cond);

for ii = 1:length(ts)
    cla;
    plot([0 sin(ys(ii, 1))], [0 -cos(ys(ii, 1))], 'k', 'LineWidth', 3);
    plot(sin(ys(ii, 1)), -cos(ys(ii, 1)), 'ro');
    pause(0.05);
end


%plot(ys(:,1), ys(:,2), 'Color', [0.5, 0, 0]);
%scatter(ys(:,1), ys(:,2), 10, '.', 'MarkerFaceColor', [0.5, 0, 0], ...
%    'MarkerEdgeColor', [0.5, 0, 0]);
%figure();
%diff = ys(2:end, :) - ys(1:end-1, :);
%q = diff(2:end, :) ./ diff(1:end-1, :);
%plot(q(10:end-1,1), q(10:end-1,2));
%plot(diff(10:end-1,1), diff(10:end-1,2));
%plot(ys(10:end-1,1), ys(10:end-1,2));
%plot(q);