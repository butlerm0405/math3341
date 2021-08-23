% MATH 3340, Spring 2021
% Final Project Problem 3
% Author: Libao Jin
% Date: 05/04/2021

clc; clear; figure(4); hold on;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;
if test == 1
    f = @(x) abs(3 * x.^2 - 5) + abs(4 * x - 3);
    a = -2;
    b = 2;
    funcString = 'f(x) = |3 * x^2 - 5| + |4 * x - 3|';
    titleString = {'(REPLACE THIS WITH YOUR OWN PLOT)', sprintf('Minimum of $f(x) = |3 x^2 - 5| + |4x - 3|$ on $[%d, %d]$', a, b)};
    legendString = {'$f(x) = |3 x^2 - 5| + |4x - 3|$', 'Successive Parabolic', 'Golden Section'};
else
    f = @(x) abs(x.^2 - 2) + abs(2 * x + 3);
    a = -4;
    b = 0;
    funcString = 'f(x) = |x^2 - 2| + |2 * x + 3|';
    titleString = sprintf('Minimum of $f(x) = |x^2 - 2| + |2x + 3|$ on $[%d, %d]$', a, b);
    legendString = {'$f(x) = |x^2 - 2| + |2x + 3|$', 'Successive Parabolic', 'Golden Section'};
end
tol = 1e-8;

[m1, fm1] = successive_parabolic(f, a, b, tol);
[m2, fm2] = golden_section(f, a, b, tol);

if test == 1
    fprintf('(REPLACE THIS WITH YOUR OWN OUTPUT)\n');
end
fprintf('%s on [%d, %d]\n', funcString, a, b);
fprintf('%20s %11s %11s\n', 'method', 'x_min', 'f(x_min)');
fprintf('%20s %11.8f %11.8f\n', 'Successive Parabolic', m1, fm1);
fprintf('%20s %11.8f %11.8f\n', 'Golden Section', m2, fm2);

x = linspace(a, b, 500);
y = f(x);
plot(x, y);
plot(m1, fm1, 'o');
plot(m2, fm2, '*');
grid on;
grid minor;
xlabel('$x$');
ylabel('$y$');
legend(legendString, 'Location', 'best');
title(titleString);
