% Math 3341, Fall 2021
% Lab 12: Romberg Integration
% Author: Melissa Butler
% Date: 11/15/2021

clear; clc;
n = 9;

%% Test function 1: f(x) = 2 * x / (x^2 - 4).
fprintf('--------------------- Test function 1 ---------------------\n');
% lower bound and upper bound for f
f_bound = [1, 1.6];
% define symbolic function
syms x
f_symbolic = 2 * x / (x ^ 2 - 4);
% define anynomous function
f_handle = @(x) 2 * x ./ (x .^ 2 - 4);
If_romberg = lab_12_romberg(f_handle, f_bound(1), f_bound(2), n);
error_f = lab_12_compare_integral(f_symbolic, x, f_handle, f_bound, If_romberg, n);

%% 4(a) Test function 2: g(x) = x^3 * sin(x).
fprintf('\n--------------------- Test function 2 ---------------------\n');
% lower bound and upper bound for g
g_bound = [0, pi];
% define symbolic function
syms x
g_symbolic = x^3 * sin(x);
% define anynomous function
g_handle = @(x) x.^3 .* sin(x);
Ig_romberg = lab_12_romberg(g_handle, g_bound(1), g_bound(2), n);
error_g = lab_12_compare_integral(g_symbolic, x, g_handle, g_bound, Ig_romberg, n);

%% 4(b) Test function 3: h(x) = x^3 * (log(x))^2.
fprintf('\n--------------------- Test function 3 ---------------------\n');
% lower bound and upper bound for h
h_bound = [1, 5];
% define symbolic function
syms x
h_symbolic = x^3 * (log(x))^2;
% define anynomous function
h_handle = @(x) x.^3 .* (log(x)).^2;
Ih_romberg = lab_12_romberg(h_handle, h_bound(1), h_bound(2), n);
error_h = lab_12_compare_integral(h_symbolic, x, h_handle, h_bound, Ih_romberg, n);

%% 4(c) Test function 4: p(x) = log(log(log(x))).
fprintf('\n--------------------- Test function 4 ---------------------\n');
% lower bound and upper bound for p
p_bound = [exp(1)^exp(1), exp(1)^4];
% define symbolic function
syms x
p_symbolic = log(log(log(x)));
% define anynomous function
p_handle = @(x) log(log(log(x)));
Ip_romberg = lab_12_romberg(p_handle, p_bound(1), p_bound(2), n);
error_p = lab_12_compare_integral(p_symbolic, x, p_handle, p_bound, Ip_romberg, n);

%% Visualize the error
% Change default text interpreter to LaTeX
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

fig = figure(1);
hold on;
% plot error of f(x) against n
plot(error_f, 'o-', 'LineWidth', 4);
% plot error of g(x) against n
plot(error_g, 'o-', 'LineWidth', 4);
% plot error of h(x) against n
plot(error_h, 'o-', 'LineWidth', 4);
% plot error of p(x) against n
plot(error_p, 'o-', 'LineWidth', 4);
% Formatting graph
grid on;
legend({
    '$\displaystyle f(x) = \frac{2x}{x^2 - 4}$',...
    '$g(x) = x^3 \sin{x}$',...
    '$h(x) = x^3 (\ln{x})^2$',...
    '$p(x) = \ln{\ln{\ln{x}}}$'}, 'Location', 'best');
set(gca, 'YScale', 'log');
xlabel('$n$');
ylabel('error');
title('Romberg integration error for $\displaystyle \frac{2x}{x^2 - 4}$, $x^3 \sin{x}$, $x^3 (\ln{x})^2$, $\ln{\ln{\ln{x}}}$');

% save plots
fig.PaperPositionMode = 'auto';
f1_pos = fig.PaperPosition;
fig.PaperSize = [f1_pos(3) f1_pos(4)];
print(fig, '-dpdf', 'lab_12_figure.pdf')