% MATH 3340, Fall 2020
% Homework 3, Problem 1
% Author: Libao Jin
% Date: 10/04/2020

clc; clear; figure(1);
% change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

A = [5 -1 1 1; 1 7 2 2; 2 1 5 1; 1 -1 1 4];
b = [9; 3; 7; 6];
x0 = [0; 0; 0; 0];
maxIter = 100;
tol = 1e-5;
[x, iters, res] = jacobi(A, b, x0, maxIter, tol);

fprintf('%10s %10s %10s %10s %10s\n', 'iterations', 'x', 'y', 'z', 'w');
for i = 1:length(x)
    fprintf('%10d %10.4f %10.4f %10.4f %10.4f\n', i - 1, x(1, i), x(2, i), x(3, i), x(4, i));
end

semilogy(iters, res);
xlabel('Iteration Number');
ylabel('Norm of Residual');
title('Jacobi method');
grid on;
grid minor;
