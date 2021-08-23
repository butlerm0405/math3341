% MATH 3340, Spring 2021
% Final Project Problem 1
% Author: Libao Jin
% Date: 05/04/2021

clear; close all; clc; format short;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;
if test == 1
    xdata = [0.8, 1.9, 4.3, 5.5]';
    ydata = sin(xdata);
    x = linspace(xdata(1), xdata(end), 100)';
    fx = sin(x);
    titleString1 = {'(REPLACE THIS WITH YOUR OWN PLOT)', 'Cubic Spline with Natural Boundary Conditions'};
    titleString2 = {'(REPLACE THIS WITH YOUR OWN PLOT)', 'Cubic Spline with $S''''(x_0) = -\sin(x_0)$ and $S''''(x_3) = -\sin(x_3)$'};
else
    xdata = [0.0, 1.761062, 3.522123, 5.283185]';
    ydata = [1.0, -0.1891196, -0.9284676, 0.5403023]';
    x = linspace(xdata(1), xdata(end), 100)';
    fx = cos(x);
    titleString1 = "Cubic Spline with Natural Boundary Conditions";
    titleString2 = "Cubic Spline with $S''''(x_0) = -\cos(x_0)$ and $S''''(x_3) = -\cos(x_3)$";
end

[y1, coefs1] = cubic_spline(xdata, ydata, x, 0, test);

if test == 1
    fprintf('(REPLACE THIS WITH YOUR OWN OUTPUT)\n');
end
fprintf('Problem 1(a)\n');
fprintf('%1s %10s %10s %10s %10s\n', 'i', 'd_i', 'c_i', 'b_i', 'a_i');
for i = 1:size(coefs1, 1)
    fprintf('%1d %10.6f %10.6f %10.6f %10.6f\n', i - 1, coefs1(i, 1), coefs1(i, 2), coefs1(i, 3), coefs1(i, 4))
end

% 1(a)
figure(1);
plot(x, fx, '-', x, y1, '--', xdata, ydata, 'o');
xlabel('$x$');
ylabel('$y$');
grid on;
grid minor;
if test == 1
    legend({'$f(x) = \sin(x)$', 'cubic spline', 'data points'}, 'Location', 'best');
else
    legend({'$f(x) = \cos(x)$', 'cubic spline', 'data points'}, 'Location', 'best');
end
title(titleString1);

% 1(b)
[y2, coefs2] = cubic_spline(xdata, ydata, x, 1, test);
fprintf('\nProblem 1(b)\n');
fprintf('%1s %10s %10s %10s %10s\n', 'i', 'd_i', 'c_i', 'b_i', 'a_i');
for i = 1:size(coefs2, 1)
    fprintf('%1d %10.6f %10.6f %10.6f %10.6f\n', i - 1, coefs2(i, 1), coefs2(i, 2), coefs2(i, 3), coefs2(i, 4))
end
figure(2);
plot(x, fx, '-', x, y2, '--', xdata, ydata, 'o');
xlabel('$x$');
ylabel('$y$');
grid on;
grid minor;
if test == 1
    legend({'$f(x) = \sin(x)$', 'cubic spline', 'data points'}, 'Location', 'best');
else
    legend({'$f(x) = \cos(x)$', 'cubic spline', 'data points'}, 'Location', 'best');
end
title(titleString2);
