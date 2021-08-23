% MATH 3340, Fall 2020
% Homework 3, Problem 3
% Author: Libao Jin
% Date: 10/04/2020
clc; clear; figure(3); hold on;

% change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

A = [7 1 2; 1 -5 2; 2 1 5];
[L, U] = lu(A);
x = [];

for m = 0:20
    b = [0.01 * m^2 - 2 * m; 2 - m; 9];
    z = L \ b;
    x(:, m + 1) = U \ z;
end

fprintf('%9s %10s %10s %10s\n', 'm', 'x', 'y', 'z');
for i = 1:size(x, 2)
    fprintf('%9d %10.4f %10.4f %10.4f\n', i - 1, x(1, i), x(2, i), x(3, i));
end

m = 0:20;
plot(m, x(1, :), 'o-');
plot(m, x(2, :), '^--');
xlabel('$m$');
ylabel('$x$ and $y$');
title('System of Linear Equations');
legend('$x$', '$y$', 'Location', 'best');
grid on;
grid minor;
