% MATH 3340, Spring 2020
% Homework 5, Problem 1
% Author: Libao Jin
% Date: 04/01/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;

if test == 1
    f = @(x) 1 ./ (4 + 50 * x.^2);
    n = 15;
    a = -2;
    b = 2;
else
    f = @(x) 1 ./ (1 + 16 * x.^2);
    n = 9;
    a = -1;
    b = 1;
end

%% 1(b)
figure(1); hold on;
% Put your code for 1(b) below
xdata = linspace(a, b, n + 1)';
ydata = f(xdata);
x = linspace(a, b, 100)';
y = f(x);
p1 = lagrange(xdata, ydata, x);
plot(x, y, '-');
plot(x, p1, '--');
plot(xdata, ydata, '*');
grid minor;
xlabel('$x$');
ylabel('$y$');
title('Lagrange Interpolants using Equispaced Nodes');
if test == 1
    legend('$f(x) = \frac{1}{4 + 50 x^{2}}$',  'Lagrange Interpolants', 'Data Points', 'Location', 'best');
else
    legend('$f(x) = \frac{1}{1 + 16 x^{2}}$',  'Lagrange Interpolants', 'Data Points', 'Location', 'best');
end

%% 1(c)
figure(2); hold on;
% Put your code for 1(c) below
k = 0:n;
xdata = -cos(k * pi / n)' * (b - a) / 2;
ydata = f(xdata);
x = linspace(a, b, 100)';
y = f(x);
p2 = lagrange(xdata, ydata, x);
grid minor;
plot(x, y, '-');
plot(x, p2, '--');
plot(xdata, ydata, '*');
xlabel('$x$');
ylabel('$y$');
title('Lagrange Interpolants using Chebyshev Nodes');
if test == 1
    legend('$f(x) = \frac{1}{4 + 50 x^{2}}$',  'Lagrange Interpolants', 'Data Points', 'Location', 'best');
else
    legend('$f(x) = \frac{1}{1 + 16 x^{2}}$',  'Lagrange Interpolants', 'Data Points', 'Location', 'best');
end
