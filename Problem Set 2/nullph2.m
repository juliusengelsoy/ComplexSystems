clear all
close all
clc

f = @(t,Y) [(Y(1)-Y(1).^3-Y(2))./0.1; 2*Y(1)-Y(2)+2];

y1 = linspace(-3,3,20);
y2 = linspace(-3,3,20);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid. Note that x and y are matrices of the same
% size and shape, in this case 20 rows and 20 columns
[x,y] = meshgrid(y1,y2);
%size(x)
%size(y)

u = zeros(size(x));
v = zeros(size(x));

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

figure(1)
hold on
quiver(x,y,u,v,'r')
xlabel('$x$','FontSize',8)
ylabel('$y$','FontSize',8)
% hl2 = legend('$x$ nullcline: $y = x - x^{3}$', '$y$ nullcline: $y = 2x + 2$');
set(gca,'FontSize',8)
% set(hl2,'FontSize',8)
set(gcf, 'Position', [1 1 200 150])
axis([-3 3 -3 3]);

th = 0:pi/6:11*pi/6;

y20 = [3*cos(th) 0.5*cos(th); 3*sin(th) 0.5*sin(th)];
s = size(y20);
s = s(2);

for i = 1:s
    [ts,ys] = ode45(f,[0,100],[y20(1,i);y20(2,i)]);
    plot(ys(:,1),ys(:,2))
    %plot(ys(1,1),ys(1,2),'bo') % starting point
    %plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off
% matlabfrag('nullphase2')

%%
clear all

f = @(t,Y) [(Y(1)-Y(1).^3-Y(2))./0.1; 2*Y(1)-Y(2)+sqrt((1+0.1+2*sqrt(2*0.1))/3)+((1+0.1+2*sqrt(2*0.1))/3)^(3/2)+0.01];%(3+1)/3^(3/2)];

y1 = linspace(-3,3,20);
y2 = linspace(-3,3,20);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid. Note that x and y are matrices of the same
% size and shape, in this case 20 rows and 20 columns
[x,y] = meshgrid(y1,y2);
%size(x)
%size(y)

u = zeros(size(x));
v = zeros(size(x));

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

figure(2)
hold on
quiver(x,y,u,v,'r')
xlabel('$x$','FontSize',8)
ylabel('$y$','FontSize',8)
% hl2 = legend('$x$ nullcline: $y = x - x^{3}$', '$y$ nullcline: $y = 2x + 2$');
set(gca,'FontSize',8)
% set(hl2,'FontSize',8)
set(gcf, 'Position', [1 1 200 150])
axis([-3 3 -3 3]);

th = 0:pi/6:11*pi/6;

%y20 = [3*cos(th) 0.5*cos(th); 3*sin(th) 0.5*sin(th)];
y20 = [-2 -2.5 -3; -0.7 -1 -1.5];
s = size(y20);
s = s(2);

for i = 1:s
    [ts,ys] = ode45(f,[0,100],[y20(1,i);y20(2,i)]);
    plot(ys(:,1),ys(:,2))
    %plot(ys(1,1),ys(1,2),'bo') % starting point
    %plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off
matlabfrag('nullphasebc')