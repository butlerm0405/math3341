% MATH 3340, Fall 2020
% Homework 6, Problem 3
% Author: Libao Jin
% Date: 10/28/2020

close all; clear; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;
if test == 1
    f = @(x) exp(x) ./ (1 + x + x.^2 / 2 + x.^3 / 3 + x.^4 / 4);
    fp_exact = 0;
    fpp_exact = 0;
else
    f = @(x) exp(x) ./ (1 + x.^2);
    fp_exact = 1;
    fpp_exact = -1;
end
% Put your code for 3 for calculating the error of first derivative using central difference below
n = [-1:-1:-7]';
dx = 10 .^ n;
[fp1, fpp1, fp2, fpp2] = central_difference(f, 0, dx)

figure(1);
fp_err = abs(fp1 - fp_exact);
fp_err(fp_err == 0) = eps;
loglog(dx, fp_err, '-o');
grid minor;
xlabel('$\Delta x$');
ylabel('Error');
if test == 1
    title('Error for First Derivative of $f(x) = \frac{e^{x}}{1 + x + x^2 / 2 + x^3 / 3 + x^4 / 4}$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    title('Error for First Derivative of $f(x) = \frac{e^{x}}{1 + x^2}$');
end
legend({'$f''(x)$'}, 'Location', 'best');

figure(2);
% Put your code for 3 for calculating the error of second derivative using central difference
fpp_err = abs(fpp1 - fpp_exact);
fpp_err(fpp_err == 0) = eps;
loglog(dx, fpp_err, '-o');
grid minor;
xlabel('$\Delta x$');
ylabel('Error');
if test == 1
    title('Error for Second Derivative of $f(x) = \frac{e^{x}}{1 + x + x^2 / 2 + x^3 / 3 + x^4 / 4}$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    title('Error for Second Derivative of $f(x) = \frac{e^{x}}{1 + x^2}$');
end
legend({'$f''''(x)$'}, 'Location', 'best');

figure(3);
fp_err = abs(fp2 - fp_exact);
fp_err(fp_err == 0) = eps;
loglog(dx, fp_err, '-o');
grid minor;
xlabel('$\Delta x$');
ylabel('Error');
if test == 1
    title('Error for First Derivative of $f(x) = \frac{e^{x}}{1 + x + x^2 / 2 + x^3 / 3 + x^4 / 4}$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    title('Error for First Derivative of $f(x) = \frac{e^{x}}{1 + x^2}$');
end
legend({'$f''(x)$'}, 'Location', 'best');

figure(4);
% Put your code for 3 for calculating the error of second derivative using central difference
fpp_err = abs(fpp2 - fpp_exact);
fpp_err(fpp_err == 0) = eps;
loglog(dx, fpp_err, '-o');
grid minor;
xlabel('$\Delta x$');
ylabel('Error');
if test == 1
    title('Error for Second Derivative of $f(x) = \frac{e^{x}}{1 + x + x^2 / 2 + x^3 / 3 + x^4 / 4}$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    title('Error for Second Derivative of $f(x) = \frac{e^{x}}{1 + x^2}$');
end
legend({'$f''''(x)$'}, 'Location', 'best');