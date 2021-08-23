close all; clear; clc;
% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

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
disp('Example 2 -- Output pi in different formats');
% Using a cell array to hold option names
format    % reset to default format
options = {'loose', 'compact', 'short', 'long', ...
           'shorte', 'longe', 'shortg', 'longg', ...
           'shorteng', 'longeng', 'rat'};
for i = 1:length(options)
    format(options{i});
    pi
end

%% Example 3: sprintf
hour = 11;
minute = 20;
am = 'a.m.';
currentTime = sprintf('The current time is: %d:%d %s', hour, minute, am)

%% Example 4: fprintf
x = [0:.2:1]'
fx = [x,exp(x)]
fileHandle = fopen('exp.txt','w');
fprintf(fileHandle,'%6s %12s\n','x','exp(x)');
% Format the output row by row using a for-loop
for i = 1:size(fx, 1)
    fprintf(fileHandle, '%6.2f %12.8f\n', fx(i, 1), fx(i, 2));
end
fclose(fileHandle);
% View the contents of the file with the `type` command
type('exp.txt');

%% Example 5: fprintf for LaTeX
x = [0:.2:1]'; fx = [x,exp(x)];
fileHandle = fopen('exp.tex','w');
fprintf(fileHandle, '\\begin{table}[!hbtp]\n');               % \begin{table}[!hbtp]
fprintf(fileHandle, '\\centering\n');                         % \centering
fprintf(fileHandle, '\\begin{tabular}{cc}\n');                % \begin{tabular}{cc}
fprintf(fileHandle, '\\toprule\n');                           % \toprule
fprintf(fileHandle, '%6s & %12s \\\\\n','$x$','$\exp(x)$');
fprintf(fileHandle, '\\midrule\n');                           % \midrule
for i = 1:size(fx, 1)
    fprintf(fileHandle, '$%4.2f$ & $%10.8f$ \\\\\n', fx(i, 1), fx(i, 2));
end
fprintf(fileHandle, '\\bottomrule\n');                        % \bottomrule
fprintf(fileHandle, '\\end{tabular}\n');                      % \end{tabular}
fprintf(fileHandle, '\\end{table}\n');                        % \end{table}
fclose(fileHandle);
% View the contents of the file with the `type` command
type('exp.tex');

%% Example 6: plot multiple functions using for-loop 
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
xTick = [-2 * pi, -3/2 * pi, -pi, -pi/2, 0, pi/2, pi, 3/2 * pi, 2 * pi];
xTickLabel = {'$-2\pi$', '$-3\pi/2$', '$-\pi$', '$-\pi/2$',...
               '$0$', '$\pi/2$', '$\pi$', '$3\pi/2$', '$2\pi$'};
set(gca, 'XTick', xTick);
set(gca, 'XTickLabel', xTickLabel);
set(gca, 'Box', 'on');

% Save figure
name = 'lab_05_example';
fig = figure(1);                         % Set figure i as current figure window
set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
pos = get(fig, 'PaperPosition');         % Get figure window paper position
set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
print(fig, '-dpdf', name);               % Save figure
