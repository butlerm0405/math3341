% Math 3341, Fall 2021
% Lab 12: Romberg Integration
% Author: first_name last_name
% Date: 11/15/2021

clear; clc; warning off;
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

% %% 4(a) Test function 2: g(x) = x^3 * sin(x).
% fprintf('\n--------------------- Test function 2 ---------------------\n');
% % lower bound and upper bound for g
% g_bound = ;
% % define symbolic function
% syms x
% g_symbolic = ;
% % define anynomous function
% g_handle = ;
% Ig_romberg = ;
% error_g = ;
% 
% %% 4(b) Test function 3: h(x) = x^3 * (log(x))^2.
% fprintf('\n--------------------- Test function 3 ---------------------\n');
% % lower bound and upper bound for h
% h_bound = ;
% % define symbolic function
% syms x
% h_symbolic = ;
% % define anynomous function
% h_handle = ;
% Ih_romberg = ;
% error_h = ;
% 
% %% 4(c) Test function 4: p(x) = log(log(log(x))).
% fprintf('\n--------------------- Test function 4 ---------------------\n');
% % lower bound and upper bound for p
% p_bound = ;
% % define symbolic function
% syms x
% p_symbolic = ;
% % define anynomous function
% p_handle = ;
% Ip_romberg = ;
% error_p = ;

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

% plot error of h(x) against n

% plot error of p(x) against n

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
pos = fig.PaperPosition;
fig.PaperSize = [pos(3) pos(4)];
print(fig, '-dpdf', 'lab_12_figure.pdf')
