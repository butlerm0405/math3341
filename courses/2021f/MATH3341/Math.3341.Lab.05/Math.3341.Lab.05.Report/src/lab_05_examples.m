close all; clear; clc;

%% Example 1
disp('Example 1 -- Output pi in different formats');
format
format('loose');    pi
format('compact');  pi
format('short');    pi
format('long');     pi
format('shorte');   pi
format('longe');    pi
format('shortg');   pi
format('longg');    pi
format('shorteng'); pi
format('longeng');  pi
format('rat');      pi

%% Example 2: using a for-loop
disp('Example 2 -- Using a for-loop to output pi in different formats');
% Using a cell-type variable to hold array of strings
types = {'loose', 'compact', ...
         'short', 'long', ...
         'shorte', 'longe', ...
         'shortg', 'longg', ...
         'shorteng', 'longeng', ...
         'rat'};
format
for i = 1:length(types)
    format(types{i}); pi
end

%% Example 3: fprintf

x = [0:.2:1]';
A = [x exp(x)];
A_size = size(A);

file_handle = fopen('exp.txt','w');
fprintf(file_handle,'%6s %12s\n','x','exp(x)');
for i = 1:A_size(1)
    fprintf(file_handle, '%6.2f %12.8f\n', A(i, 1), A(i, 2));
end
% fprintf(file_handle,'%6.2f %12.8f\n', A');
fclose(file_handle);

% View the contents of the file with the `type` command
type('exp.txt');

%% Example 4: fprintf for LaTeX
x = [0:.2:1]';
A = [x exp(x)];
A_size = size(A);

file_handle = fopen('exp.tex','w');
fprintf(file_handle, '\\begin{table}[!hbtp]\n');               % \begin{table}[!hbtp]
fprintf(file_handle, '\\centering\n');                         % \centering
fprintf(file_handle, '\\caption{Exponential function}\n');     % \caption{Exponential function}
fprintf(file_handle, '\\label{tab:exp}\n');                    % \label{tab:exp}
fprintf(file_handle, '\\begin{tabular}{cc}\n');                % \begin{tabular}{cc}
fprintf(file_handle, '\\hline\n');                             % \hline
fprintf(file_handle, '%6s & %12s \\\\\n','$x$','$\exp(x)$'); 
fprintf(file_handle, '\\hline\n');                             % \hline
for i = 1:A_size(1)
    fprintf(file_handle, '$%4.2f$ & $%10.8f$ \\\\\n', A(i, 1), A(i, 2));
end
% fprintf(file_handle, '$%4.2f$ & $%10.8f$ \\\\\n', A');
fprintf(file_handle, '\\hline\n');                             % \hline
fprintf(file_handle, '\\end{tabular}\n');                      % \end{tabular}
fprintf(file_handle, '\\end{table}\n');                        % \end{table}
fclose(file_handle);

% View the contents of the file with the `type` command
type('exp.tex');

%% Example 5: plot multiple functions using for-loop 
% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

figure(1); hold on;

x = linspace(-2 * pi, 2 * pi, 100);
y1 = sin(x);
y2 = cos(x);
y3 = sin(x) + cos(x);
y4 = sin(x) .* cos(x);
y = {y1, y2, y3, y4};
linetypes = {'o-', '*--', 'd-.', '^:'};
for i = 1:4
    plot(x, y{i}, linetypes{i});
end
xlabel('$x$');
ylabel('$y$');
title('Trig functions');
grid minor;
axis tight;
functions = {'$\sin(x)$', '$\cos(x)$', '$\sin(x) + \cos(x)$', '$\sin(x) \times \cos(x)$'};
legend(functions, 'Location', 'best');
x_ticklabel = {'$-2\pi$', '$-3\pi/2$', '$-\pi$', '$-\pi/2$',...
               '$0$', '$\pi/2$', '$\pi$', '$3\pi/2$', '$2\pi$'};
x_tick = [-2 * pi, -3/2 * pi, -pi, -pi/2, 0, pi/2, pi, 3/2 * pi, 2 * pi];
set(gca, 'XTick', x_tick);
set(gca, 'XTickLabel', x_ticklabel);
set(gca, 'Box', 'on');

% Save figure
name = 'lab_05_example';
fig = figure(1);                         % Set figure i as current figure window
set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
pos = get(fig, 'PaperPosition');         % Get figure window paper position
set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
print(fig, '-dpdf', name);               % Save figure