% MATH 3340, Spring 2021
% Final Project Problem 2
% Author: Libao Jin
% Date: 05/04/2021

clc; clear; figure(3); hold on;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

test = 0;
if test == 1
    u0 = 1;
    a = 0;
    b = 2;
    dt = 0.05;
    t = a:dt:b;
    t_fine = a:0.0001:b;
    f = @(t, u) t * u / 2;
    df = @(t, u) t / 2;
    u = @(t) exp(t.^2 / 4);
else
    u0 = 1;
    a = 0;
    b = 2;
    dt = 0.05;
    t = a:dt:b;
    t_fine = a:b;
    f = @(t, u) 2 + sqrt(u - 2 * t + 3);
    df = @(t, u) 1 / (2 * sqrt(u - 2 * t + 3));
    u = @(t) 1 + 4 * t + t.^2 / 4;
end
% Implicit Backward Euler method
u_euler = backward_euler(f, df, t, u0);
u_exact = u(t_fine);

% Use built-in function ode45 to find the solution
plot(t_fine, u_exact, '-');
plot(t, u_euler, 'o');
grid minor;
xlabel('$t$');
ylabel('$u(t)$');
if test == 1
    legend({'$u(t) = e^{t^{2} / 4}$', 'Backward Euler method'}, 'Location', 'best', 'Color', 'none');
    title('Solution to $\frac{du}{dt} = \frac{ut}{2}$ (REPLACE THIS WITH YOUR OWN PLOT)');
else
    legend({'$u(t) = 1 + 4t + t^{2}/4$', 'Backward Euler method'}, 'Location', 'best', 'Color', 'none');
    title('Solution to $\frac{du}{dt} = 2 + \sqrt{u - 2t + 3}$');
end
