% MATH 3340, Fall 2020
% Homework 8, Problem 3
% Author: first_name last_name
% Date: 11/23/2020

clear; close all; clc;
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

% PUT YOUR CODE HERE
test = 0;
if test == 1
    f = @(x) x.^2 + 4 * x + 3;
    a = -3;
    b = 1;
else
    f = @(x) cos(x) - sin(x);
    a = 1;
    b = 3;
end
tol = 1e-7;

[m, fm] = goldenSection(f, a, b, tol);

if test == 1
    fprintf('f(x) = x^2 + 4*x + 3 reaches the minimum %.8f at x = %.8f. (REPLACE THIS WITH YOUR OWN OUTPUT)\n', fm, m);
else
    fprintf('f(x) = cos(x) - sin(x) reaches the minimum %.8f at x = %.8f.\n', fm, m);
end

x = linspace(a, b);
y = f(x);
figure(1); hold on;
plot(x, y);
plot(m, fm, 'o');


grid minor;
xlabel('$x$');
ylabel('$y$');

if test == 1
    legend({'$f(x) = x^{2} + 4x + 3$', 'Minimum found by Golden Section'}, 'Location', 'best');
    title('Minimum of $f(x) = x^{2} + 4x + 3$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    legend({'$f(x) = \cos(x) - \sin(x)$', 'Minimum found by Golden Section'}, 'Location', 'best');
    title('Minimum of $f(x) = \cos(x) - \sin(x)$');
end

r = (3 - sqrt(5)) / 2;
s = 1 - r;
tol = 0.1;
n = log(tol * 2 / (b - a)) / log(s);
