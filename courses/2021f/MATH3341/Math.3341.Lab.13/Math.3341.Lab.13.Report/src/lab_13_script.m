% Math 3341, Fall 2021
% Lab 13 Histograms, Random Numbers and Monte Carlo Integration
% Author: Melissa Butler
% Date: 11/22/2021

clear; close all; clc; warning off;
% change default text interpreter to LaTeX
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% 1 Random Numbers and Histogram
% generate random data
N = 10000;
a = -3.5;
b = 3.5;
x_unifrom = rand(N, 1) * (b - a) + a;
x_normal = randn(N, 1);

% generate figure with histograms
fig = figure(1);
set(fig, 'Units', 'Normalized', 'OuterPosition', [0.25 0.25 0.5 0.5]);
hold on;

% histogram of random data in the interval [a, b]
histogram(x_unifrom);

% histogram of normal data
histogram(x_normal);

% add legend, xlabel, ylabel, title
grid minor;
legend({'Histogram using $\mathrm{rand}$',...
        'Histogram using $\mathrm{randn}$'},...
       'Location', 'best');
xlabel('value','FontSize',12);
ylabel('count','FontSize',12);
title('Histogram of $\mathrm{rand}$ vs. $\mathrm{randn}$');

% save plots
fig.PaperPositionMode = 'auto';
pos = fig.PaperPosition;
fig.PaperSize = [pos(3) pos(4)];
print(fig, '-dpdf', 'lab_13_figure.pdf')

%% Monte Carlo Integration
% use Monte Carlo integration to calculate f(x, y) over S
xmin = -1;
xmax =  1;
ymin1 = 0;
ymax1 = 2;
f = @(x, y) x + 2 * y;
checker = @(x, y) (y < (1 + x.^2)) & (y > (2 * x.^2));
N = 100000;
I_m = monteCarlo(f, checker, xmin, xmax, ymin1, ymax1, N);

% use integral2 to calculate f(x, y) over S
ymin2 = @(x) 2 * x .^ 2;
ymax2 = @(x) 1 + 1 * x .^ 2;
I_i = integral2(f, xmin, xmax, ymin2, ymax2);
fprintf('%12s %12s %12s\n', 'Monte Carlo', 'Built-in', 'Error');
fprintf('%12f %12f %12f\n', I_m, I_i, abs(I_m - I_i));
