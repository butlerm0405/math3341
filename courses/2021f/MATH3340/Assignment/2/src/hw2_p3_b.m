% MATH 3340, Spring 2020
% Homework 2, Problem 3 (b)
% Author: Libao Jin
% Date: 02/13/2020

clear; clc;
f = @(x) 1/2 + x.^2 / 4 - x .* sin(x) - cos(2 * x) / 2;
df = @(x) x / 2 - sin(x) - x .* cos(x) + sin(2 * x);
x0 = [pi/2, 5 * pi, 10 * pi];
fprintf('%10s %10s %10s\n', 'x*', 'f(x*)', 'iters')
for i = 1:length(x0)
    [r, iters] = newton(f, df, x0(i));
    fprintf('%10f %10f %10d\n', r, f(r), iters)
end
