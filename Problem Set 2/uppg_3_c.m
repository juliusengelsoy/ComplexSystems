warning off;
clear all;
close all;
clc;

%pml = printProgress('Initializing...', 0);

a = 0.1;
b = 0.1;
no_c = 10;
c = linspace(4,20,no_c);

f_dx = @(x,y,z) -y - z;
f_dy = @(x,y,z) x + a.*y;
f_dz = @(x,y,z,c) b + z.*(x - c);

f = @(t, Y, c) [f_dx(Y(1), Y(2), Y(3)); f_dy(Y(1), Y(2), Y(3)); f_dz(Y(1), Y(2), Y(3), c)];

t_min = 0;
t_max = 300;
t_steps = 3000;

no_part = 5;
start_dist = 0.001;

dists = zeros(size(c,2), t_steps);

for ii = 1:size(c,2)
    pos = zeros(no_part, t_steps, 3);
    
    start_pos = [c(ii) 0 0];
    
    for jj = 1:no_part
        msg = ['c-value ' num2str(ii) ' of ' num2str(size(c,2)) ...
            ', particle ' num2str(jj) ' of ' num2str(no_part) ...
            ' (' num2str(ii/size(c,2)*100) '%) ' ...
            'Simulating...'];
        clc
        disp(msg)
        %pml = printProgress(msg, pml);
        y0 = start_pos + start_dist*[cos(2*pi*jj/no_part), sin(2*pi*jj/no_part), 0];
    
        [~,ys] = ode45(@(t,y) f(t,y,c(ii)), linspace(t_min, t_max, t_steps), y0);
        
        pos(jj, :, :) = ys;    
    end
    
    tot = 1/2*no_part*(no_part+1);
    for jj = 1:no_part-1
            msg = ['c-value ' num2str(ii) ' of ' num2str(size(c,2)) ...
            ', particle ' num2str(jj) ' of ' num2str(no_part) ...
            ' (' num2str(ii/size(c,2)*100) '%) ' ...
            'Calculating...'];
        clc
        disp(msg)
            %pml = printProgress(msg, pml);
        for kk = jj:no_part
            dists(ii,:) = dists(ii,:) + sqrt(sum(((pos(jj,:,:)-pos(kk,:,:)).^2),3))/tot;
        end
    end
    
end

plot(dists');
