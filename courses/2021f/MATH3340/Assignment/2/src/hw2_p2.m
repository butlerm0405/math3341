% MATH 3340, Spring 2020
% Homework 2, Problem 2
% Author: Libao Jin
% Date: 02/13/2020

clear; clc;
f = @(x) x.^3 + 3 * x + 1;
df = @(x) 3 * x.^2 + 3;
x0 = -2;
[r, iters] = newton(f, df, x0);
fprintf('%10s %10s %10s\n', 'x*', 'f(x*)', 'iters')
fprintf('%10f %10f %10d\n', r, f(r), iters)
