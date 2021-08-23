% MATH 3340, Spring 2020
% Homework 4, Problem 3
% Author: first_name last_name
% Date: 03/05/2020

clc; clear;
% change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')
figure(3); hold on;

xx = [0.0 0.1 0.2 0.3 0.4 0.5]';
yy = [1.388 1.647 1.951 2.633 3.321 3.977]';
% xx = [-0.5 -0.25 0 0.25 0.5]';
% yy = [0.4 1.5 5.5 17 62]';

% C e^(Ax) => ln(y) = Ax + ln(C)
A = [xx ones(size(xx))];
b = log(yy);
c = (A' * A) \ (A' * b);

fprintf('%8s %8s\n', 'A', 'C');
fprintf('%8.4f %8.4f\n', c(1), exp(c(2)));

x = min(xx):0.01:max(xx);
y = exp(c(1) * x) * exp(c(2));

plot(xx, yy, 'o');
plot(x, y, '-');
xlabel('$x$');
ylabel('$y$');
title('Exponential fit');
grid minor;
legend(...
    {'data points',sprintf('$f(x) = %.4f e^{%.4f x}$', exp(c(2)), c(1))},...
    'Location', 'best');
