% Math 3341, Fall 2021
% Lab 14: Built-in ODE Solvers in MATLAB
% Author: Melissa Butler
% Date: 11/29/2021

clear; close all; warning off;
% change default text interpreter to LaTeX
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
LineStyle = {'-', '.', '--', '-.'};

%% 1 Direction Fields and Solution Curves

% 1(a)
dydt = @(t, y) -y - 5 * exp(-t) .* sin(5 * t);
% 1(b)
a = 0;
b = 3;
% 1(c)
t_step = 0.01;
% 1(d)
t_span = a:t_step:b;
% 1(g)
y0 = [-2, 0, 2, 4];

for i = 1:length(y0)
    % 1(e)
    [t_out, y_out] = ode23(dydt, t_span, y0(i));
    t_sol(:, i) = t_out;
    y_sol(:, i) = y_out;
end

% data for direction field
n = 15;
tpts = linspace(a, b - 0.1, n);
ypts = linspace(-2.9, 4, n);
[t, y] = meshgrid(tpts, ypts);
pt = ones(size(y));
py = dydt(t, y);
% plot direction field and solution curves
figure(1);
quiver(t, y, pt, py, 0.5);
hold on;
lgd = {'$y''(t)$'};

for i = 1:length(y0)
    % 1(f): plot y_sol(:, i) versus t_sol(:, i) using LineStyle{i}
    plot(t_sol(:, i), y_sol(:, i), LineStyle{i});
    lgd{i + 1} = sprintf('$y_0 = %d$', y0(i));
end

title('$\displaystyle \frac{dy}{dt} = -y - 5e^{-t} \sin(5t)$');
xlabel('$t$');
ylabel('$y$');
legend(lgd, 'Location', 'best');

%% 2 System of ODEs

% 2(a)
f = @(t, y) [y(3); y(4); -2 * y(1) + (3 / 2) * y(2); (4 / 3) * y(1) - 3 * y(2)];
% 2(b)
a = 0;
b = 15;
t_step = 0.01;
t_span = a:t_step:b;
y0 = [-1; 4; 1; 1];
% 2(c)
[t, y] = ode45(f, t_span, y0);

figure(2);
hold on;
for i = 1:4
    % 2(d): plot y(:, i) versus t using LineStyle{i}
    plot(t, y(:, i), LineStyle{i});
end
xlabel('$t$');
ylabel('$y$');
title('$y_1(t)$, $y_2(t)$, $y_3(t)$, $y_4(t)$ vs. $t$');
legend({'$y_1(t)$','$y_2(t)$', '$y_3(t)$', '$y_4(t)$'}, 'Location', 'best');
grid minor;

figure(3);
% 2(e): plot y3 versus y1
plot(y(:, 1), y(:, 3));
xlabel('$y_1(t)$');
ylabel('$y_3(t)$');
title('$y_3(t)$ vs. $y_1(t)$');
grid minor;

% save plots
for i = 1:3
    fig = figure(i);
    set(findall(fig, '-property', 'FontSize'), 'FontSize', 16);
    set(get(gca, 'Children'), 'LineWidth', 1)
    fig.PaperPositionMode = 'auto';
    pos = fig.PaperPosition;
    fig.PaperSize = [pos(3) pos(4)];
    print(fig, '-dpdf', sprintf('lab_14_figure_%d.pdf', i));
end