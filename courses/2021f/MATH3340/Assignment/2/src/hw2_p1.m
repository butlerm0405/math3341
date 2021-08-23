% MATH 3340, Spring 2020
% Homework 2, Problem 1
% Author: Libao Jin
% Date: 02/13/2020

clear; clc;
f = @(x) (x.^3 + 3 * x + 1) .* (x <= 0) + (1 + sin(x)) .* (x > 0);
[r, iters] = bisection(f, -2, 0.1);
fprintf('%10s %10s %10s\n', 'x*', 'f(x*)', 'iters')
fprintf('%10f %10f %10d\n', r, f(r), iters)
