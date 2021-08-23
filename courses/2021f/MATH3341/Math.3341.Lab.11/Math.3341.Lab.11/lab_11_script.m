% Math 3341, Fall 2021
% Lab 11: MATLAB Integration Routines & Gauss Quadrature
% Author: first_name last_name
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

% 1(a)
a = ;
b = ;
% using polyint
% define polynomial
P = ;
% calculate the integral with polyint
pI = ;
% evaluates the integral on [a,b]
pI_value = ;
% using integral
f = ;
I = ;

fprintf('\n------------------ (a) -----------------\n')
fprintf('Integrating x.^2 - 2.*x + 1 on [%d,%d]\n', a, b);
fprintf(' Using polyint I = %f\n', pI_value)
fprintf('Using integral I = %f\n', I)
fprintf('           Error = %e\n', diff([pI_value,I]))

%----------------------------------------------
% Single integrals - trapz & cumtrapz
%----------------------------------------------
x = linspace(a, b);
y = f(x);

% 1(b)
% evaluate integral via ydata (discrete data) using trapz
trapI = ;   
cumtrapI = ;

fprintf('\n------------------ (b) -----------------\n')
fprintf('Integrating x.^2 - 2.*x + 1 on [%d,%d]\n', a, b);
fprintf('Using trapz and cumtrapz\n\n')
fprintf('   Using trapz I = %f\n', trapI)
fprintf('           Error = %e\n', abs(diff([I, trapI])))
fprintf('Using cumtrapz: \n')
fprintf('     %f\n',cumtrapI)

%----------------------------------------------
% Double integrals
%----------------------------------------------

% 1(c)
f3 = ;
I3 = ;

fprintf('\n------------------ (c) -----------------\n')
fprintf('Integrating f(x,y) = y*sin(x) + x*cos(y)\n')
fprintf(' Using integral2 I = %f\n', I3)

%----------------------------------------------
% Triple integrals
%----------------------------------------------

% 1(d)
f4 = ;
I4 = ;

% prints results of calculations
fprintf('\n------------------ (d) -----------------\n')
fprintf('Integrating f(x,y,z) = y \n\n')
fprintf(' Using integral3 I = %f\n', I4)

%% 2 Gauss Quadrature

% define f
f = ;
a = ;
b = ;
% define g (f after change of variable)
g = ;
% find exact value of integral using integral
f_exact= ;
% print results of calculations
fprintf('\n=============== Part 2 ==============\n')
fprintf('Integrating 2*x./(x.^2-4) on [%.1f %.1f] \n', a, b)
fprintf('Exact Value I = %.16f\n\n', f_exact)

fprintf('Using gaussQuad.m :\n')
% place function calls for gaussQuad below
errors = [];
fprintf('%2s %19s %19s\n', 'N', 'Gauss Quadrature', 'Error');
for N = 1:15
    f_gauss = ;
    errors(N) = ;
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
