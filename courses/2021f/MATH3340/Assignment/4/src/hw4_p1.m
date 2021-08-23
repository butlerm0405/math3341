% MATH 3340, Spring 2020
% Homework 4, Problem 1
% Author: first_name last_name
% Date: 03/05/2020

clc; clear;

% f = @(x) [x(1)^2 + x(2)^3 - 1; x(1)^3 + x(2)^2 + 0.25];
% df = @(x) [2 * x(1), 3 * x(2)^2; 3 * x(1)^2, 2 * x(2)];

f = @(x) [x(1)^2 + x(2)^3 - 1; x(1)^3 - x(2)^2 + 0.25];
df = @(x) [2 * x(1), 3 * x(2)^2; 3 * x(1)^2, -2 * x(2)];
x0 = [0.5; 0.5];
maxIter = 100;
tol = 1e-6;
[x, iters, res] = newtonNonlinear(f, df, x0, maxIter, tol);
f(x0)
df(x0)
fprintf('%12s %10s %10s %10s\n', 'iterations', 'x', 'y', 'res');
for i = 1:length(iters)
    fprintf('%12d %10.4f %10.4f %10.2e\n', iters(i), x(1, i), x(2, i), res(i));
end

clear;
f = @(x) [x(1)^2 + x(2)^3 - 1; x(1)^3 + x(2)^2 + 0.25];
df = @(x) [2 * x(1), 3 * x(2)^2; 3 * x(1)^2, 2 * x(2)];
x0 = [0.5; 0.5];
maxIter = 100;
tol = 1e-6;
[x, iters, res] = newtonNonlinear(f, df, x0, maxIter, tol);
f(x0)
df(x0)
fprintf('%12s %10s %10s %10s\n', 'iterations', 'x', 'y', 'res');
for i = 1:length(iters)
    fprintf('%12d %10.4f %10.4f %10.2e\n', iters(i), x(1, i), x(2, i), res(i));
end
