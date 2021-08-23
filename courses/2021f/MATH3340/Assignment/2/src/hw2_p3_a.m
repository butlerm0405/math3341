% MATH 3340, Spring 2020
% Homework 2, Problem 3 (a)
% Author: Libao Jin
% Date: 02/13/2020

clear; clc;
f = @(x) 1/2 + x.^2 / 4 - x .* sin(x) - cos(2 * x) / 2;
fprintf('%10s %10s %10s\n', 'x*', 'f(x*)', 'iters')
[r, iters] = bisection(f, 0, pi);
fprintf('%10f %10f %10d\n', r, f(r), iters)
[r, iters] = bisectionImproved(f, 0, pi);
fprintf('%10f %10f %10d\n', r, f(r), iters)
fplot(f, [0, pi]);