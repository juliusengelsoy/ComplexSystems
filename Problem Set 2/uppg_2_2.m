close all
clear all
clc

%A= 1.3;
%A = 1.4;
A = 1.15;
gamma = 0.5;
w = 1;
%W = 0.5;
W = 2/3;%gamma/2*(sqrt(4*(w/gamma)^2-1))

f = @(t,Y) [Y(2); -w.^2*sin(Y(1)) - gamma*Y(2) + A*cos(W*t)];
inc = 100;
t_range = 0:2*pi/W/inc:300*2*pi/W;
%t_range = 0:10*pi:5000*pi;
%in_cond = [0 0; 1.8 2.5];
in_cond = [-2; 0];

dom = [-pi pi; -pi pi];
margin = 0;
subs = [30, 15];

% xdom = linspace(dom(1,1), dom(1,2), subs(1));
% ydom = linspace(dom(2,1), dom(2,2), subs(2));
% 
% [X, Y] = meshgrid(xdom, ydom);
% 
% U = Y;
% V = -w.^2*sin(X) - gamma*Y;

fig_1 = figure(1);
hold on;

xlabel('$\phi$');
ylabel('$\omega$');
% 
% % quiver(X, Y, U, V, 'r'); %'Color', [0.6, 0.6, 0.6]);
axis equal;
% % axis tight;
axis([dom(1, 1)-margin dom(1,2)+margin dom(2, 1)-margin dom(2,2)+margin]);
% 
col = ['b' 'g' 'r'];


% step = 0.0001;
% a = 0.9:step:1.6;
% xlabel('$A$');
% ylabel('$\omega$');
% % axis([0.95 1.55 -3.5 0])
% for ii = 1:length(a)
%     fb = @(t,Y) [Y(2); -w.^2*sin(Y(1)) - gamma*Y(2) + a(ii)*cos(W*t)];
%     [ts, ys] = ode45(fb, t_range, in_cond);
%     clc
%     disp([num2str(ii/length(a)*100) '%'])
%     %plot(ys(:,1), ys(:,2), col(ii)) %'Color', [0.5, 0, 0]);
%     %scatter(ys(:,1), ys(:,2), 10, '.', 'MarkerFaceColor', [0.5, 0, 0], ...
%     %    'MarkerEdgeColor', [0.5, 0, 0]);
%     %figure();
%     %diff = ys(2:end, :) - ys(1:end-1, :);
%     %q = diff(2:end, :) ./ diff(1:end-1, :);
%     %plot(q(10:end-1,1), q(10:end-1,2));
%     %plot(diff(10:end-1,1), diff(10:end-1,2));
%     %plot(ys(10:end-1,1), ys(10:end-1,2));
%     %plot(q);
%     y = ys(101*inc:inc:150*inc,2);
%     plot(a(ii)*ones(1,length(y)), y, 'r.','markersize', 1)
% end

for ii = 1:size(in_cond, 2)
    [ts, ys] = ode45(f, t_range, in_cond(:,ii));
    [ts1, ys1] = ode23(f, t_range, in_cond(:,ii));
    plot(ys(:,1), ys(:,2), 'b', ys1(:,1), ys1(:,2), 'g') %'Color', [0.5, 0, 0]);
    %scatter(ys(:,1), ys(:,2), 10, '.', 'MarkerFaceColor', [0.5, 0, 0], ...
    %    'MarkerEdgeColor', [0.5, 0, 0]);
    %figure();
    %diff = ys(2:end, :) - ys(1:end-1, :);
    %q = diff(2:end, :) ./ diff(1:end-1, :);
    %plot(q(10:end-1,1), q(10:end-1,2));
    %plot(diff(10:end-1,1), diff(10:end-1,2));
    %plot(ys(10:end-1,1), ys(10:end-1,2));
    %plot(q);
    %plot(ys(1000:500:end,1), ys(1000:500:end,2), 'ro')
    %plot(0*ones(1,length(ys(1000:500:end,1))), ys(1000:500:end,1), 'r.','markersize', 1)
end
hold off

set(gcf, 'Position', [1 1 350 350])
% matlabfrag('sens1')
%%




%%
a = [1.3 1.3 1.3];
figure(2)
hold on
for ii = 1:3 %size(in_cond, 2)
    f = @(t,Y) [Y(2); -w.^2*sin(Y(1)) - gamma*Y(2) + a(ii)*cos(W*t)];
    [ts, ys] = ode45(f, 0:2*pi/W:1000*2*pi/W, [0 0.5*A]);
    %plot(ys(:,1), ys(:,2), 'Color', [0.5, 0, 0]);
    %scatter(ys(:,1), ys(:,2), 10, '.', 'MarkerFaceColor', [0.5, 0, 0], ...
    %    'MarkerEdgeColor', [0.5, 0, 0]);
    %figure();
    diff1 = ys(2:end, :) - ys(1:end-1, :);%;ys(4:end, :) - ys(3:end-1, :);ys(6:end, :) - ys(5:end-1, :)];
    %diff2 = ys(4:end, :) - ys(3:end-1, :);
    %diff3 = ys(6:end, :) - ys(5:end-1, :);
    %q = diff(2:end, :) ./ diff(1:end-1, :);
    %plot(q(10:end-1,1), q(10:end-1,2));
    plot(diff1(500:end-10,1), diff1(500:end-10,2),col(ii));
    %plot(ys(10:end-1,1), ys(10:end-1,2));
    %plot(q);
end

hold off


%%
fig_2 = figure(2);
axis equal;
hold on;
axis([-1.5 1.5 -1.5 1.5]);

%axis([dom(1, 1)-margin dom(1,2)+margin dom(2, 1)-margin dom(2,2)+margin]);

% [ts, ys] = ode45(f, t_range, in_cond);

for ii = 1:length(ts)
    cla;
    plot([0 sin(ys(ii, 1))], [0 -cos(ys(ii, 1))], 'k', 'LineWidth', 3);
    plot(sin(ys(ii, 1)), -cos(ys(ii, 1)), 'ro');
    pause(0.05);
end
hold off