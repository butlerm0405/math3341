clear      % clears all variables
close all  % closes all figure windows
clc        % clear command window

% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

% Example: plot(x, y)
x = linspace(0, 2 * pi, 100);
y = sin(x);
figure(1);
plot(x, y);

% Example: plot(y)
x = linspace(0, 2 * pi, 100);
y = sin(x);
figure(2);
plot(y);

% Example: plot(x, y, style)
x = linspace(0, 2 * pi, 100);
y = sin(x);
style1 = 'go-.';  % green, circle, dashdot
style2 = 'r+:';   % red, plus, dotted
style3 = 'm*--';  % magenta, star, dashed
figure(3);
plot(x, y, style1);
figure(4);
plot(x, y, style2);
figure(5);
plot(x, y, style3);

% Example: plot(x1, y1, style1, x2, y2,style2,...)
x = linspace(0, 2 * pi, 100);
y1 = sin(x);
y2 = cos(x);
y3 = sin(2 * x);
style1 = 'go-.';
style2 = 'r+:';
style3 = 'm*--';
figure(6);
plot(x, y1, style1, x, y2, style2, x, y3, style3);

% Example: hold on
x = linspace(0, 2 * pi, 100);
y1 = sin(x);
y2 = cos(x);
y3 = sin(2 * x);
style1 = 'go-.';
style2 = 'r+:';
style3 = 'm*--';
figure(7);
hold on;
plot(x, y1, style1);
plot(x, y2, style2);
plot(x, y3, style3);

% Example: title, grid, xlabel, ylabel, legend
figure(8); hold on;
plot(x, y1, style1);
plot(x, y2, style2);
plot(x, y3, style3);
title('Trig functions');
grid on;  % grid minor;
xlabel('$x$');
ylabel('$y$');
legend('$\sin(x)$', '$\cos(x)$', '$\sin(2x)$', ...
       'Location', 'best');
axis([0, 2 * pi, -1, 1]);

% Example: gcf, gca, get, set
x = linspace(0, 2 * pi, 100);
y = sin(x);
figure(9);
plot(x, y);
axis([0, 2 * pi, -1, 1]);
set(get(gca, 'Title'), 'String', '$\sin(x)$');
set(get(gca,'Children'),...
        'LineWidth', 1.0,...
        'LineStyle', ':',...
        'Marker', 'd',...
        'MarkerSize', 4,...
        'MarkerEdgeColor', 'y',...
        'MarkerFaceColor', 'r');
set(gca, 'XTick', [0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
set(gca, 'XTickLabel', {'0', '$\pi/2$', '$\pi$',...
         '$3 \pi / 2$', '$2\pi$'});

% Example: subplot
x = linspace(0, 2 * pi, 100);
y1 = sin(x);
y2 = cos(x);
y3 = sin(2 * x);
y4 = cos(2 * x);
figure(10);
subplot(2, 2, 1);
plot(x, y1, 'gd-');  title('$\sin(x)$');
subplot(2, 2, 2);
plot(x, y2, 'ro:');  title('$\cos(x)$');
subplot(2, 2, 3);
plot(x, y3, 'ch-.'); title('$\sin(2x)$');
subplot(2, 2, 4);
plot(x, y4, 'b<--'); title('$\cos(2x)$');

% Example: plotyy
x = 0:0.1:10;
y1 = 200 * exp(-0.05 * x) .* sin(x);
y2 = 0.8 * exp(-0.5 * x) .* sin(10 * x);
figure(11)
[hAx, hLine1, hLine2] = plotyy(x,y1,x,y2,'plot','stem');
set(hLine1, 'LineStyle', '--');
set(hLine2, 'LineStyle', ':');
grid minor;
xlabel('Time ($\mu$s)')
ylabel(hAx(1), 'Slow Decay')
ylabel(hAx(2), 'Fast Decay')
title('Multiple Decay Rates')

% Example: print
mkdir figures                                % Create a folder named "figures"
prefix = './figures/figure_';
for i = 1:11
    name = strcat(prefix, num2str(i));       % Set filename for figure i
    fig = figure(i);                         % Set figure i as current figure window
    set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
    pos = get(fig, 'PaperPosition');         % Get figure window paper position
    set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
    print(fig, '-dpdf', name);               % Save figure
end
