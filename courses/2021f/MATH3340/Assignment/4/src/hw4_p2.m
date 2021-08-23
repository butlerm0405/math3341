% MATH 3340, Spring 2020
% Homework 4, Problem 2
% Author: first_name last_name
% Date: 03/05/2020

clc; clear;

f = @(x) [10 - x(1) + sin(x(1) + x(2)) - 1; 8 * x(2) - cos(x(3) - x(2)) ^ 2 - 1; 12 * x(3) + sin(x(3)) - 1];
df = @(x) [
      -1 + cos(x(1) + x(2)), cos(x(1) + x(2)), 0;
      0, 8 - 2 * cos(x(3) - x(2)) * sin(x(3) - x(2)), 2 * cos(x(3) - x(2)) * sin(x(3) - x(2));
      0, 0, 12 + cos(x(3))
    ];
x0 = [0.1; 0.25; 0.08];
maxIter = 100;
tol = 1e-6;
[x, iters, res] = newtonNonlinear(f, df, x0, maxIter, tol);

fprintf('%12s %10s %10s %10s %10s\n', 'iterations', 'x', 'y', 'z', 'res');
for i = 1:length(iters)
    fprintf('%12d %10.4f %10.4f %10.4f %10.2e\n', iters(i), x(1, i), x(2, i), x(3, i), res(i));
end