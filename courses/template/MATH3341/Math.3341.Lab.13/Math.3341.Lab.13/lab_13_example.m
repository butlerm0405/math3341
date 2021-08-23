% Random number generators
% Uniform Distribution
close all; clear; clc;
rand(5)
rand(5, 1)
rand(1000, 1);

left = -2;
right = 2;
x = rand(1000, 1) * (right - left) + left;
figure(1);
histogram(x);

% Normal Distribution
randn(5)
randn(5, 1)
randn(1000, 1);

mu =   -2;
sigma = 2;
y = randn(1000, 1) * sigma + mu;
figure(2);
histogram(y);

% Random Number Generator
s = rng;
rand(5, 1)
rand(5, 1)

% Restore rng
rng(s);
rand(5, 1)
rand(5, 1)

% Integrate f(x, y) = x^2 over the disk centered at the origin with radius 1
f = @(x, y) x.^2;
xmin =  -1;
xmax =   1;
ymin1 = -1;
ymax1 =  1;
I_wrong = integral2(f, xmin, xmax, ymin1, ymax1)  % WRONG! This is integrating over a box not the disk
ymin2 = @(x) -sqrt(1 - x.^2);
ymax2 = @(x)  sqrt(1 - x.^2);
I_exact = integral2(f, xmin, xmax, ymin2, ymax2)

% Monte Carlo Integration for f(x, y) = x^2 over the disk centered at the origin with radius 1
ymin =-1;
ymax = 1;
N = 100000;
x = rand(N, 1) * (xmax - xmin) + xmin;
y = rand(N, 1) * (ymax - ymin) + ymin;
V = (ymax - ymin) * (xmax - xmin);
% Discard points outside the disk
checker1 = @(x, y) -sqrt(1 - x.^2) <= y & y <= sqrt(1 - x.^2);  % More general
checker2 = @(x, y) ((x.^2 + y.^2) <= 1);                        % Equivalent to checker1
g1 = @(x, y) f(x, y) .* checker1(x, y);                         % set function value to zero if the point is outside the region
g2 = @(x, y) f(x, y) .* checker2(x, y);                         % set function value to zero if the point is outside the region
I_monte_carlo_1 = V / N * sum(g1(x, y))
I_monte_carlo_2 = V / N * sum(g2(x, y))

