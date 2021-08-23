% MATH 3340, Fall 2020
% Homework 8, Problem 2
% Author: first_name last_name
% Date: 11/23/2020

clear; close all; clc;
rng(1204);

% PUT YOUR CODE HERE
test = 0;
if test == 1
    f = @(x, y, z) x.^3 + y.^2 + z;
    xmin = -2;
    xmax =  2;
    ymin = -2;
    ymax =  2;
    zmin = -2;
    zmax =  2;
    r = (xmax - xmin) / 2;
    % checker = @(x, y, z) x.^2 + y.^2 + z.^2 <= ((xmax - xmin) / 2)^2;
    checker = @(x, y, z) -sqrt(r^2 - x.^2) <= y & y <= sqrt(r^2 - x.^2) & -sqrt(r^2 - x.^2 - y.^2) <= z & z <= sqrt(r^2 - x.^2 - y.^2);
else
    f = @(x, y, z) 0.7 * (x.^2 + y.^2 + z.^2);
    xmin = -1;
    xmax =  1;
    ymin = -1;
    ymax =  1;
    zmin = -1;
    zmax =  1;
    r = (xmax - xmin) / 2;
    checker = @(x, y, z) -sqrt(r^2 - x.^2) <= y & y <= sqrt(r^2 - x.^2) & -sqrt(r^2 - x.^2 - y.^2) <= z & z <= sqrt(r^2 - x.^2 - y.^2);
end
M = 1e6;
n = 10;
I = 0;
for i = 1:n
    I = I + monteCarlo(f, checker, xmin, xmax, ymin, ymax, zmin, zmax, M);
end
I_monte_carlo = I / n;

r = (xmax - xmin) / 2;
xmin2 = xmin;
xmax2 = xmax;
ymin2 = @(x) -sqrt(r^2 - x.^2);
ymax2 = @(x) sqrt(r^2 - x.^2);
zmin2 = @(x, y) -sqrt(r^2 - x.^2 - y.^2);
zmax2 = @(x, y) sqrt(r^2 - x.^2 - y.^2);
I_exact = integral3(f, xmin2, xmax2, ymin2, ymax2, zmin2, zmax2);

err = abs(I_monte_carlo - I_exact);

if test == 1
    fprintf('Monte Carlo integration for f(x, y, z) = x^3 + y^2 + z over the ball x^2 + y^2 + z^2 <= %d: (REPLACE THIS WITH YOUR OWN OUTPUT)\n', r^2);
else
    fprintf('Monte Carlo integration for f(x, y, z) = 0.7 * (x^2 + y^2 + z^2) over the ball x^2 + y^2 + z^2 <= %d:\n', r^2);
end
fprintf('%20s %20s %20s\n', 'I_monte_carlo', 'I_exact', 'error');
fprintf('%20.6f %20.6f %20.6f\n', I_monte_carlo, I_exact, err);
