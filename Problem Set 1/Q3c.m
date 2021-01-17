clear all
close all
clc

f = @(t,Y) [1+Y(2)-exp(-Y(1)); Y(1)^3-Y(2)];

y1 = linspace(-1,1,20);
y2 = linspace(-1,1,20);

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

quiver(x,y,u,v,'r'); figure(gcf)
xlabel('$x$')
ylabel('$y$')
axis([-1 1 -1 1]);

y20 = [-0.05 0.05 -0.1 0.11;0.2 -0.2 0.2 -0.2];
s = size(y20);
s = s(2);
hold on
for i = 1:s
    [ts,ys] = ode45(f,[0,50],[y20(1,i);y20(2,i)]);
    plot(ys(:,1),ys(:,2))
    %plot(ys(1,1),ys(1,2),'bo') % starting point
    %plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off

set(gcf, 'Position', [1 1 400 300])
matlabfrag('q3c')