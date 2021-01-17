clear all
close all
clc

%fig1 = open('magnify2.fig');
fig1 = open('3d.fig');
xlabel('$x_{k}$')
ylabel('$x_{k+1}$')

h = get(gca,'Children');

set(gcf, 'position', [1 1 400 300])%'PaperPositionMode','auto')
set(gcf, 'PaperPositionMode', 'auto')
set(h,'MarkerSize',3)

set(gca, 'box', 'on');
magnifyOnFigure(fig1, 'initialPositionSecondaryAxes', [200 70 100 70],...
        'initialPositionMagnifier', [265 247.76 1 0.7], 'edgeWidth', 1);

    