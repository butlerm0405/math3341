% Math 3341, Fall 2021
% Lab 14: Built-in ODE Solvers in MATLAB
% Author: first_name last_name
% Date: 11/29/2021

clear; close all; warning off;
% change default text interpreter to LaTeX
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
LineStyle = {'-', '.', '--', '-.'};

%% 1 Direction Fields and Solution Curves

% 1(a)
dydt = ;
% 1(b)
a = ;
b = ;
% 1(c)
t_step = ;
% 1(d)
t_span = ;
% 1(g)
y0 = [-2];

for i = 1:length(y0)
    % 1(e)
    [t, y] = ;
    t_sol(:, i) = t;
    y_sol(:, i) = y;
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
    
    lgd{i + 1} = sprintf('$y_0 = %d$', y0(i));
end

title('$\displaystyle \frac{dy}{dt} = -y - 5e^{-t} \sin(5t)$');
xlabel('$t$');
ylabel('$y$');
legend(lgd, 'Location', 'best');

%% 2 System of ODEs

% 2(a)
f = @(t, y) ;
% 2(b)
a = ;
b = ;
t_step = ;
t_span = ;
y0 = ;
% 2(c)
[t, y] = ;

figure(2);
hold on;
for i = 1:4
    % 2(d): plot y(:, i) versus t using LineStyle{i}
    
end
xlabel('$t$');
ylabel('$y$');
title('$y_1(t)$, $y_2(t)$, $y_3(t)$, $y_4(t)$ vs. $t$');
legend({'$y_1(t)$','$y_2(t)$', '$y_3(t)$', '$y_4(t)$'}, 'Location', 'best');
grid minor;

figure(3);
% 2(e): plot y3 versus y1

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
