% MATH 3340, Spring 2020
% Homework 2, Problem 4
% Author: Libao Jin
% Date: 02/13/2020

clear; clc;
f = @(x) x.^2 - 7;
[r, iters] = bisectionRecursive(f, -1, 9);
fprintf('%10s %10s %10s\n', 'x*', 'f(x*)', 'iters')
fprintf('%10f %10f %10d\n', r, f(r), iters)
