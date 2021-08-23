% Math 3341, Fall 2021
% Lab 03: Functions and Control Flows
% Author: Melissa Butler
% Date: 09/06/2021

clc             % clear command window
close all       % close figure windows
clear           % clear variables workspace
format compact  % show results in compact format

%% 1 Anonymous Function

% 1(a)
rowSums = @(mat) sum(mat, 2)
magicMat5 = magic(5)
magicMat7 = magic(7)
magicMat5RowSums = rowSums(magicMat5)
magicMat7RowSums = rowSums(magicMat7)

% 1(b)
f = @(x) x .* log(x)
g = @(y) y .* exp(y)
h = @(z) g(f(z))
z = linspace(1, 5, 11)'
hz = h(z)

% 1(c)
matProd = @(A, B) A * B * B' * A'
A = reshape(colon(1, 6), 3, 2)'
B = reshape(colon(7, 18), 3, 4)
matProdAB = matProd(A, B)

% 1(d)
p = @(x) x.^3 .* (x < -1) + x .* (-1 <= x & x <= 1) + x.^2 .* (x > 1)
fplot(p, [-2, 2])
print(gcf, '-dpng', 'lab_03_1d.png')

%% 2 Function Files

% 2(c)
fprintf('%2s %20s %20s\n', 'n', 'factorialRecursive', 'factorialIterative');
for n = 1:20
    f1 = factorialRecursive(n);
    f2 = factorialIterative(n);
    fprintf('%2d %20d %20d\n', n, f1, f2);
end

%% 3 Application: Real-Life Problems

% 3(a)
dayOfWeek(1970, 1, 7)
dayOfWeek(1970, 3, 7)
dayOfWeek(1971, 3, 8)
dayOfWeek(1988, 8, 8)
dayOfWeek(1999, 9, 9)
dayOfWeek(2021, 2, 10)

% 3(b)
maxBottles1 = maxBeverageBottles(10, 2, 4, 2)
maxBottles2 = maxBeverageBottles(1000, 2, 5, 3)
