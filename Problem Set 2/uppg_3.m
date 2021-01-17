warning off;
clear all
close all
clc

%prev_msg_len = printProgress('Initializing...', 0);

a = 0.1;
b = 0.1;
no = 10;
%c = linspace(4,20,no);      % 4:20;
c = 4:0.01:20;
c1 = c(1);


f_dx = @(x,y,z) -y - z;
f_dy = @(x,y,z) x + a.*y;
f_dz = @(x,y,z,c) b + z.*(x - c);

f = @(t, Y, c) [f_dx(Y(1), Y(2), Y(3)); f_dy(Y(1), Y(2), Y(3)); f_dz(Y(1), Y(2), Y(3), c)];

t_min = 0;
t_max = 1000;

y0 = [1 1 1];

%col_ord = distinguishable_colors(no);
%fig3 = figure();
%set(gca, 'ColorOrder', col_ord);
%hold all;
%fig2 = figure();
%set(gca, 'ColorOrder', col_ord);
%hold all;
fig1 = figure(1);
%set(gca, 'ColorOrder', col_ord);
hold all;

for ii = 1:size(c,2)
    msg = strcat('Simulating, ', num2str(ii/size(c,2)*100), ' done');
    %prev_msg_len = printProgress(msg, prev_msg_len);
    c1 = c(ii);
    [~,ys] = ode45(@(t,y) f(t,y,c(ii)),[t_min, t_max], y0);
    
    [peaks, inds] = findpeaks(ys(:,3));
    
    figure(fig1);
    plot(c(ii),peaks(end-100:end),'r.','markersize',1)
    %plot(peaks);
    %figure(fig2);
    %plot(peaks(1:end-1), peaks(2:end), '.');
    %figure(fig3);
    %plot3(ys(:,1),ys(:,2),ys(:,3));
end
%fprintf('\n');
set(gcf, 'Position', [1 1 400 300])
%axis([4 20 0 35])
xlabel('$c$')
ylabel('$z$')
%matlabfrag('rossbx')
hold off;
warning on;