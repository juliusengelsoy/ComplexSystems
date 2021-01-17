clear all
close all
clc

funx = @(x) x - x.^3;
funy0 = @(x) 2*x;
funy2 = @(x) 2*x + 2;

x = -3:0.01:3;

figure(1)
hold on
axis([-3 3 -3 3])
plot(x,funx(x), x, funy2(x))
plot([0 0],[-25 25],'k--')
plot([-3 3],[0 0],'k--')
xlabel('$x$','FontSize',8)
ylabel('$y$','FontSize',8)
% hl2 = legend('$x$ nullcline: $y = x - x^{3}$', '$y$ nullcline: $y = 2x + 2$');
set(gca,'FontSize',8)
% set(hl2,'FontSize',8)
set(gcf, 'Position', [1 1 200 150])
matlabfrag('null2')

figure(2)
hold on
axis([-3 3 -3 3])
plot(x,funx(x), x, funy0(x))
plot([0 0],[-25 25],'k--')
plot([-3 3],[0 0],'k--')
xlabel('$x$','FontSize',8)
ylabel('$y$','FontSize',8)
% hl0 = legend('$x$ nullcline: $y = x - x^{3}$', '$y$ nullcline: $y = 2x$');
set(gca,'FontSize',8)
% set(hl0,'FontSize',8)
set(gcf, 'Position', [1 1 200 150])
matlabfrag('null0')

