% MATH 3340, Fall 2020
% Homework 6, Problem 2
% Author: Libao Jin
% Date: 10/28/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;

%% 2(a)
% Put your code for 2(a) below
if test == 1
    f = @(x) 1 ./ (4 + 25 * x .^ 2);
    a = -2;
    b = 2;
    n = 8;
else
    f = @(x) 1 ./ (1 + 14 * x .^ 2);
    a = -1;
    b = 1;
    n = 10;
end
xdata = linspace(a, b, n)';
ydata = f(xdata);
x = linspace(a, b, 100)';
fx = f(x);

%% 2(c)
figure(1); hold on;
% Put your code for 2(c) below
[y, C] = cubic_spline(xdata, ydata, x);
C
p = lagrange(xdata, ydata, x);

plot(x, fx, '-', 'LineWidth', 1)
plot(x, y, '--', 'LineWidth', 1)
plot(x, p, '-.', 'LineWidth', 1)
plot(xdata, ydata, 'o');
xlabel('$x$');
ylabel('$y$');
grid minor;
if test == 1
    legend({'$f(x) = \frac{1}{4 + 25 x^2}$', 'cubic spline', 'lagrange', 'nodes', }, 'Location', 'best');
    title('Cubic Spline and Lagrange Interpolation (REPLACE THIS WITH YOUR OWN PLOT)');
else
    legend({'$f(x) = \frac{1}{1 + 16 x^2}$', 'cubic spline', 'lagrange', 'nodes', }, 'Location', 'best');
    title('Cubic Spline and Lagrange Interpolation');
end

