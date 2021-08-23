% Math 3341, Fall 2021
% Lab 10: MATLAB 3D Plots
% Author: Melissa Butler
% Date: 11/01/2021

clear; close all; clc;
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% 1 Define Meshgrid and Evaluate Function at Meshgrid
% 1(a)
f = @(x,y) pi^2 * (sin(pi * x) + 4 * sin(2 * pi * x) +...
    sin(pi * y) + 4 * sin(2 * pi * y));
% 1(b)
x = linspace(-1, 1, 30);
y = linspace(-1, 1, 30);
% 1(c)
[X, Y] = meshgrid(x, y);
% 1(d)
Z = f(X, Y);

%% 2 Mesh Plots
figure(1); set(gcf, 'Position', [100 100 800 600]);

subplot(2,2,1)
mesh(Z)
colormap(gca, parula)
shading interp
title('parula','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 2(b)
subplot(2,2,2)
meshc(Z)
colormap(gca, winter)
shading interp
title('winter','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 2(c)
subplot(2,2,3)
mesh(x, y, Z)
colormap(gca, pink)
shading interp
title('pink','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 2(d)
subplot(2,2,4)
mesh(Z)
colormap(gca, prism)
shading interp
title('prism','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')
hidden off

%% Surf Plots
figure(2); set(gcf, 'Position', [900 100 800 600]);

% 3(a)
subplot(2,2,1)
surf(Z)
colormap(gca, parula)
shading interp
title('parula','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 3(b)
subplot(2,2,2)
surfc(Z)
colormap(gca, winter)
shading interp
title('winter','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 3(c)
subplot(2,2,3)
surf(x, y, Z)
colormap(gca, pink)
shading interp
title('pink','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 3(d)
subplot(2,2,4)
surf(Z)
colormap(gca, prism)
shading interp
title('prism','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')
hidden off

%% Save figures
for i = 1:2
    fig = figure(i);
    fig.PaperPositionMode = 'auto';
    pos = fig.PaperPosition;
    fig.PaperSize = [pos(3) pos(4)];
    filename = sprintf('lab_10_figure_%d.pdf', i);
    print(fig, '-dpdf', filename)
end
