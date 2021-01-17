close all
clear all
clc

f = @(t,Y) [Y(2); -sin(Y(1))];

hFig = figure(1);
hold on

y20 = [-2.5 0 0.5 1 1.5 2 2.5; 6*pi 0 0 0 0 0 -2*pi];
s = size(y20);

for i = 1:s(2)
    [ts,ys] = ode45(f,[0,50],[y20(2,i);y20(1,i)]);
    plot(ys(:,1),ys(:,2),'k')
    if or(i ~= 1, i ~= s(2))
        [ts,ys] = ode45(f,[0,50],[y20(2,i)+2*pi;y20(1,i)]);
        plot(ys(:,1),ys(:,2),'k')
    end
end
% h = quiver(pi, 0, 0.5, 0.5);
% adjust_quiver_arrowhead_size(h, 10);
%arrow([pi 0],[pi+0.5 0.5], 'BaseAngle', 90, 'TipAngle', 0.7, 'Length', 10)
annotation('arrow',[0.55 0.57],[0.55 0.57])
annotation('arrow',[0.51 0.49],[0.49 0.47])
annotation('arrow',[0.55 0.57],[0.55 0.57])
annotation('arrow',[0.51 0.49],[0.49 0.47])
axis([-2 8 -2 2])
axis equal