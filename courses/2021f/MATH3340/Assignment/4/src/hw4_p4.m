% MATH 3340, Spring 2020
% Homework 4, Problem 4
% Author: first_name last_name
% Date: 03/05/2020

clc; clear;
% change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')
figure(4); hold on;

xx = [0 1 2 3 4]';
yy = [0.695 -1.475 -1.275 0.882 4.765]';

% xx = [-2 -1 0 1 2]';
% yy = [4.3 1.2 0.02 0.9 3.9]';

A = [xx.^2 xx ones(size(xx))];
c = (A' * A) \ (A' * yy);

fprintf('%8s %8s %8s\n', 'A', 'B', 'C');
fprintf('%8.4f %8.4f %8.4f\n', c(1), c(2), c(3));

% x = 0:0.1:4;
x = min(xx):0.1:max(xx);
y = c(1) * x.^2 + c(2) * x + c(3);

plot(xx, yy, 'o');
plot(x, y, '-');
xlabel('$x$');
ylabel('$y$');
title('Quadratic fit');
grid minor;
legend(...
    {'data points',sprintf('$f(x) = %.4f x^{2} + %.4f x + %.4f$', c(1), c(2), c(3))},...
    'Location', 'best');
