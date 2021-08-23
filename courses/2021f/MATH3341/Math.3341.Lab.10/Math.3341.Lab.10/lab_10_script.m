% Math 3341, Fall 2021
% Lab 10: MATLAB 3D Plots
% Author: first_name last_name
% Date: 11/01/2021

clear; close all; clc;
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% 1 Define Meshgrid and Evaluate Function at Meshgrid
% 1(a)

% 1(b)

% 1(c)

% 1(d)

%% 2 Mesh Plots
figure(1); set(gcf, 'Position', [100 100 800 600]);

subplot(2,2,1)
mesh(Z)
colormap(gca, parula)
shading interp
title('parula','FontSize',14)
xlabel('$x$'), ylabel('$y$'), zlabel('$z$')

% 2(b)

% 2(c)

% 2(d)

%% Surf Plots
figure(2); set(gcf, 'Position', [900 100 800 600]);

% 3(a)

% 3(b)

% 3(c)

% 3(d)

%% Save figures
for i = 1:2
    fig = figure(i);
    fig.PaperPositionMode = 'auto';
    pos = fig.PaperPosition;
    fig.PaperSize = [pos(3) pos(4)];
    filename = sprintf('lab_10_figure_%d.pdf', i);
    print(fig, '-dpdf', filename)
end
