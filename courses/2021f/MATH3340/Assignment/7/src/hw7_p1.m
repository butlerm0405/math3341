% MATH 3340, Fall 2020
% Homework 7, Problem 1
% Author: Libao Jin
% Date: 11/11/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')


% PUT YOUR CODE HERE
test = 0;
if test == 1
    f = @(x) x.^(3) .* (cos(x).^(3));
    a = 0;
    b = 4 * pi;
else
    f = @(x) x.^2 .* (sin(x) .^ 2);
    a = 0;
    b = 2 * pi;
end

n = 5;
I_t = trapezoidal(f, a, b, n);
I_s = simpson(f, a, b, n);
I_e = integral(f, a, b);

fprintf('%5s %12s %12s %12s %12s %12s\n', 'n', 'a', 'b', 'Trapezoidal', 'Simpson', 'Exact');
fprintf('%5d %12.6f %12.6f %12.6f %12.6f %12.6f\n', n, a, b, I_t, I_s, I_e);