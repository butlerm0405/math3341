% Math 3341, Fall 2021
% Lab 05: Formatting Output and LaTeX
% Author: Libao Jin
% Date: 09/20/2021

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

%% 1 Formatting Numerical Values
% 1(a)
x = exp(pi);
% 1(b)
format_types = {'rat', ...
         'longeng', 'longg', 'longe', 'long', ...
         'shorteng', 'shortg', 'shorte', 'short'};
% 1(c)
for i = 1:length(format_types)
    format(format_types{i}); x
end

%% 2 Formatting Numerical Values using fprintf
% 2(a)
x = linspace(0, 2 * pi, 25)';
y1 = sin(x / 2);
y2 = sin(x);
y3 = sin(2 * x);
% 2(b)
data = [x y1 y2 y3];
data_size = size(data);
% 2(c)
fprintf('%-9s %-9s %-9s %-9s\n', 'x', 'sin(x/2)', 'sin(x)', 'sin(2x)');
% 2(d)
for i = 1:data_size(1)
    fprintf('%-9.6f %-9.6f %-9.6f %-9.6f\n', data(i, 1), data(i, 2), data(i, 3), data(i, 4));
end

% fprintf('%9.6f %9.6f %9.6f %9.6f\n', data');

% 3(a)
file_handle = fopen('sin.tex', 'w');
% 3(b)(c)(d)
fprintf(file_handle, '\\begin{table}[!hbtp]\n');
fprintf(file_handle, '\\centering\n');
fprintf(file_handle, '\\caption{Sine functions}\n');
fprintf(file_handle, '\\label{tab:sine}\n');
fprintf(file_handle, '\\begin{tabular}{lcrr}\n');
fprintf(file_handle, '\\toprule\n');
fprintf(file_handle, '%11s & %11s & %11s & %11s \\\\\n', '$x$', '$\sin(x/2)$', '$\sin(x)$', '$\sin(2x)$');
fprintf(file_handle, '\\midrule\n');
% fprintf(file_handle, '$%9.6f$ & $%9.6f$ & $%9.6f$ & $%9.6f$ \\\\\n', data');
for i = 1:data_size(1)
    fprintf(file_handle, '$%9.6f$ & $%9.6f$ & $%9.6f$ & $%9.6f$ \\\\\n', data(i, 1), data(i, 2), data(i, 3), data(i, 4));
end
fprintf(file_handle, '\\bottomrule\n');
fprintf(file_handle, '\\end{tabular}\n');
fprintf(file_handle, '\\end{table}\n');
fclose(file_handle);
type('sin.tex');

%% 4 Plotting Multiple Functions using for-loop
figure(1); hold on;
% 4(a)
styles = {'o-', 'd-.', '^--'};
% 4(b)
y = {y1, y2, y3};
% 4(c)
for i = 1:3
    plot(x, y{i}, styles{i});
end
% 4(d)
legend({'$\sin(x/2)$', '$\sin(x)$', '$\sin(2x)$'}, 'Location', 'best');
grid on;
xlabel('$x$');
ylabel('$y$')
axis([0, 2*pi, -1, 1]);
title('Sine functions');
set(gca, 'XTick', [0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
set(gca, 'XTickLabel', {'0', '$\pi/2$', '$\pi$', '$3 \pi / 2$', '$2\pi$'});
set(gca, 'GridLineStyle', '--');
set(gca, 'Box', 'on');
set(gca, 'BoxStyle', 'full');

% 4(e)
name = 'lab_05_plot';
fig = figure(1);                         % Set figure i as current figure window
set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
pos = get(fig, 'PaperPosition');         % Get figure window paper position
set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
print(fig, '-dpdf', name);               % Save figure
