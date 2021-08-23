% Math 3341, Fall 2021
% Lab 13 Histograms, Random Numbers and Monte Carlo Integration
% Author: first_name last_name
% Date: 11/22/2021

clear; close all; clc; warning off;
% change default text interpreter to LaTeX
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% 1 Random Numbers and Histogram
% generate random data
% 1(a)

% 1(b)

% generate figure with histograms
fig = figure(1); hold on; set(fig, 'Units', 'Normalized', 'OuterPosition', [0.25 0.25 0.5 0.5]);

% 1(c)
% histogram of random data in the interval [a, b]

% histogram of normal data

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

%% 2 Monte Carlo Integration
% 2(b) use Monte Carlo integration to integrate f(x, y) over the region
xmin = ;
xmax = ;
ymin1 = ;
ymax1 = ;
f = ;
checker = ;
N = ;
I_m = ;

% 2(c) use integral2 to integrate f(x, y) over the region
ymin2 = ;
ymax2 = ;
I_i = ;
fprintf('%12s %12s %12s\n', 'Monte Carlo', 'Built-in', 'Error');
fprintf('%12f %12f %12f\n', I_m, I_i, I_m - I_i);
