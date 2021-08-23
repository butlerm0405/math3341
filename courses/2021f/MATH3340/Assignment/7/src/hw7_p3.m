% MATH 3340, Fall 2020
% Homework 7, Problem 3
% Author: first_name last_name
% Date: 11/11/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

% PUT YOUR CODE HERE
test = 0;
if test == 1
    f = @(x) x.^2 + cos(x);
    a = -2;
    b = 2;
    N = 5;
else
    f = @(x) (x.^3 - 1) .* exp(-x.^2);
    a = 1;
    b = 3;
    N = 5;
end

n = 1:N;

for i = 1:length(n)
    I(i) = gauss_quad(f, a, b, n(i));
    I_exact(i) = integral(f, a, b);
    error(i) = abs(I(n(i)) - I_exact(n(i)));
end

if test == 1
    fprintf('Summary for f(x) = x^2 + cos(x): (REPLACE THIS FILE WITH YOUR OWN)\n');
    fprintf('%5s %10s\n', 'N', 'I_gauss');
    for i = 1:length(n)
        fprintf('%5d %10.6f\n', n(i), I(i));
    end
else
    fprintf('Summary for f(x) = (x^3 - 1) * e^(-x^2):\n');
    fprintf('%5s %10s %10s %10s\n', 'N', 'I_gauss', 'I_exact', 'error');
    for i = 1:length(n)
        fprintf('%5d %10.6f %10.6f %10.6f\n', n(i), I(i), I_exact(i), error(i));
    end
end

