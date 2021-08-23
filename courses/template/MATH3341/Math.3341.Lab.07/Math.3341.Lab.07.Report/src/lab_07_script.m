% Math 3341, Fall 2021
% Lab 07: Debugging & Good Coding Practices
% Author: Libao Jin
% Date: 10/04/2021

clc; clear; close all;

% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

A = [4 3 0; 3 4 -1; 0 -1 4];
b = [24; 30; -24];
tol = 1e-8;
maxIter = 100;
x0 = [0; 0; 0];
w = 1.25;

[X, iter, res] = lab_07_function(A, b, x0, w, tol, maxIter);

X_size = size(X);

% Formatting the output
file_handle = fopen('sor_gauss_seidel.tex', 'w');
fprintf(file_handle, '\\begin{table}[!hbtp]\n');
fprintf(file_handle, '\\caption{Solving the linear system using SOR}\n');
fprintf(file_handle, '\\centering\n');
fprintf(file_handle, '\\begin{tabular}{lrrrr}\n');
fprintf(file_handle, '\\toprule\n');
fprintf(file_handle, '%6s & %15s & %15s & %15s & %15s \\\\\n', 'iter', '$x$', '$y$', '$z$', 'residual');
fprintf(file_handle, '\\midrule\n');
for i = 1:X_size(1)
    fprintf(file_handle, '$%4d$ & $%13.10f$ & $%13.10f$ & $%13.10f$ & $%13.7e$ \\\\\n', i - 1, X(i, 1), X(i, 2), X(i, 3), res(i));
end
fprintf(file_handle, '\\bottomrule\n');
fprintf(file_handle, '\\end{tabular}\n');
fprintf(file_handle, '\\end{table}\n');
type('sor_gauss_seidel.tex');

fprintf('\nSolution of System: \n')
fprintf('x1 = %13.10f \n', X(end, 1))
fprintf('x2 = %13.10f \n', X(end, 2))
fprintf('x3 = %13.10f \n', X(end, 3))
fprintf('Found in %d iterations\n', iter)

% Plot the solution
figure(1);
hold on;
styles = {'o-', '*:', 'v-.'};
iters = [1:X_size(1)] - 1;
for i = 1:3
    plot(iters, X(:, i), styles{i});
end
legend({'$x$', '$y$', '$z$'}, 'Location', 'best');
grid minor;
xlabel('iteration');
ylabel('solution');
title('solution vs. iteration');

figure(2);
semilogy(iters, res);
grid minor;
xlabel('iteration');
ylabel('residual');
title('residual vs. iteration');

% Save Plots
prefix = 'lab_07_plot_';
for i = 1:2
    name = strcat(prefix, num2str(i));       % Set filename for figure i
    fig = figure(i);                         % Set figure i as current figure window
    set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
    pos = get(fig, 'PaperPosition');         % Get figure window paper position
    set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
    print(fig, '-dpdf', name);               % Save figure
end
