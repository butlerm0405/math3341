% Math 3341, Fall 2021
% Lab 11: MATLAB Integration Routines & Gauss Quadrature
% Author: Melissa Butler
% Date: 11/08/2021

clear; close all; clc;
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% 1 Built-in Integration Functions
fprintf('\n=============== Part 1 ===============\n')
%----------------------------------------------
% Single integrals - integral & polyint
%----------------------------------------------
f = @(x) x.^2 - 2.*x + 1;               % define function p(x)
p = [1, -2, 1];                    % stores coeff values of p(x)
a = -1;                                 % lower bound of integral
b = 3;                                  % upper bound of integral

% 1(a)
% using polyint
pI = polyint(p);                    % calculate the integral with polyint
pI_value = diff(polyval(pI, [a, b]));         % evaluates the integral on [a,b]
% using integral
I = integral(f, a, b);

fprintf('\n------------------ 1(a) -----------------\n')
fprintf('Integrating x.^2 - 2.*x + 1 on [%d,%d]\n', a, b);
fprintf(' Using polyint I = %f\n', pI_value)
fprintf('Using integral I = %f\n', I)
fprintf('           Error = %e\n', diff([pI_value,I]))

%----------------------------------------------
% Single integrals - trapz & cumtrapz
%----------------------------------------------
xdata = -1:3;
ydata = f(xdata);

% 1(b)
% evaluate integral via ydata (discrete data) using trapz
trapI = trapz(xdata, ydata);
cumtrapI = cumtrapz(xdata, ydata);

fprintf('\n------------------ 1(b) -----------------\n')
fprintf('Integrating x.^2 - 2.*x + 1 on [%d,%d]\n', a, b);
fprintf('Using trapz and cumtrapz\n\n')
fprintf('   Using trapz I = %f\n', trapI)
fprintf('           Error = %e\n', diff([I,trapI]))
fprintf('Using cumtrapz: \n')
fprintf('     %f\n',cumtrapI)

%----------------------------------------------
% Double integrals
%----------------------------------------------

% 1(c)
f3 =  @(x,y) y.*sin(x) + x.*cos(y);
I3 = integral2(f3, -pi, -3 * pi / 2, 0, 2 * pi);

fprintf('\n------------------ 1(c) -----------------\n')
fprintf('Integrating f(x,y) = y*sin(x) + x*cos(y)\n')
fprintf(' Using integral2 I = %f\n', I3)

%----------------------------------------------
% Triple integrals
%----------------------------------------------

% 1(d)
f4 = @(x,y,z) y;
zmin = @(x,y) x-y;
zmax = @(x,y) x+y;
ymin = @(x) x.^2;
ymax = @(x) x;
xmin = 0;
xmax = 1;

I4 = integral3(f4, xmin, xmax, ymin, ymax, zmin, zmax);

% prints results of calculations
fprintf('\n------------------ 1(d) -----------------\n')
fprintf('Integrating f(x,y,z) = y \n\n')
fprintf(' Using integral3 I = %f\n', I4)

%% 2 Gauss Quadrature

% define the function for part II
f = @(x) 2*x./(x.^2-4);
a = 1;
b = 1.6;
% define g here
g = @(x) f((b - a) * x / 2 + (a + b) / 2) * (b - a) / 2;
% find exact value of integral
f_exact= integral(f, a, b);
% print results of calculations
fprintf('\n=============== Part 2 ==============\n')
fprintf('Integrating 2*x./(x.^2-4) on [%.1f %.1f] \n', a, b)
fprintf('Exact Value I = %.16f\n\n', f_exact)

fprintf('Using gaussQuad.m :\n')
% place function calls for gaussQuad below
errors = [];
fprintf('%2s %19s %19s\n', 'N', 'Gauss Quadrature', 'Error');
for N = 1:15
    f_gauss = gauss_quad(g, N);
    errors(N) = abs(f_gauss - f_exact);
    fprintf('%2d %19.16f %19.16f\n', N, f_gauss, errors(N));
end

% plot error
fig = figure(1); hold on;
plot(errors, 'o-', 'LineWidth', 1);
grid on;
set(gca, 'YScale', 'log');
xlabel('$n$');
ylabel('error');
title('Gauss quadrature error for $\displaystyle \frac{2x}{x^2 - 4}$ on $[1, 1.6]$');
fig.PaperPositionMode = 'auto';
f1_pos = fig.PaperPosition;
fig.PaperSize = [f1_pos(3) f1_pos(4)];
print(fig, '-dpdf', 'lab_11_figure.pdf')
