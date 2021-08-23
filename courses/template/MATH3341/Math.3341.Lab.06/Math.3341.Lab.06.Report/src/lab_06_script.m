% Math 3341, Fall 2021
% Lab 06: LU Decomposition
% Author: Melissa Butler
% Date: 09/27/2021

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')
format compact

%% 1 Solve a System with LU Decomposition
% 1(a)
A = [7 -26 45 -47; 1 2 3 4; 2 -11 -12 -13; 4 -17 30 35]
b = [-98; 30; -108; 200;]
% 1(b)
[L U] = lu(A)
% 1(c)
z = L \ b
% 1(d)
x = U \ z
% 1(e)
res = norm(A * x - b, 2)

%% 2 Varying the Vector b
% 2(a)
A = [3 1 1; 1 -5 2; 2 1 5];
[L U] = lu(A);
% 2(b)
m = 0:20;
% 2(c)
for i = 1:length(m)
    b = [m(i); 5; 10];
    z = L \ b;
    x = U \ z;
    X(i, :) = x;
end
% 2(d)
file_handle = fopen('solution.tex', 'w');
fprintf(file_handle, '\\begin{table}[!hbtp]\n');
fprintf(file_handle, '\\centering\n');
fprintf(file_handle, '\\caption{Solution to the linear system}\n');
fprintf(file_handle, '\\label{tab:solution}\n');
fprintf(file_handle, '\\begin{tabular}{crrr}\n');
fprintf(file_handle, '\\toprule\n');
fprintf(file_handle, '%4s & %11s & %11s & %11s \\\\\n', '$m$', '$x$', '$y$', '$z$');
fprintf(file_handle, '\\midrule\n');
for i = 1:length(m)
    fprintf(file_handle, '$%2d$ & $%9.6f$ & $%9.6f$ & $%9.6f$ \\\\\n', m(i), X(i, 1), X(i, 2), X(i, 3));
end
fprintf(file_handle, '\\bottomrule\n');
fprintf(file_handle, '\\end{tabular}\n');
fprintf(file_handle, '\\end{table}\n');
fclose(file_handle);
type('solution.tex');
% 2(e)
figure(1); hold on;
X_size = size(X);
styles = {'h--', 'p:', 'd-'};
for j = 1:X_size(2)
    plot(m, X(:, j), styles{j})
end
xlabel('$m$');
ylabel('Solution');
title('Solution to the linear system vs. $m$');
grid minor;
legend({'$x$', '$y$', '$z$'}, 'Location', 'best');
name = 'lab_06_plot';
fig = figure(1);                         % Set figure i as current figure window
set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
pos = get(fig, 'PaperPosition');         % Get figure window paper position
set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
print(fig, '-dpdf', name);               % Save figure