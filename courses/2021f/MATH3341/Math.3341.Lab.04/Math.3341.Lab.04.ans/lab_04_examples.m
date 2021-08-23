clear     % clears all variables
close all % closes all figure windows
clc

% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

% Example: plot(X,Y)
X = linspace(0, 2*pi, 100);
Y = sin(X);
figure(1);
plot(X,Y);

% Example: plot(Y)
X = linspace(0, 2*pi, 100);
Y = sin(X);
figure(2);
plot(Y);

% Example: plot(X,Y,S)
X = linspace(0, 2*pi, 100);
Y = sin(X);
S1 = 'go-.';  % green, circle, dashdot
S2 = 'r+:';   % red, plus, dotted
S3 = 'm*--';  % magenta, star, dashed
figure(3); plot(X,Y,S1);
figure(4); plot(X,Y,S2);
figure(5); plot(X,Y,S3);

% Example: plot(X1,Y1,S1,X2,Y2,S2,...)
X = linspace(0, 2*pi, 100);
Y1 = sin(X);
Y2 = cos(X);
Y3 = sin(2 * X);
S1 = 'go-.';
S2 = 'r+:';
S3 = 'm*--';
figure(6); plot(X,Y1,S1,X,Y2,S2,X,Y3,S3);

% Example: hold on
X = linspace(0, 2*pi, 100);
Y1 = sin(X);
Y2 = cos(X);
Y3 = sin(2 * X);
S1 = 'go-.';
S2 = 'r+:';
S3 = 'm*--';
figure(7);
hold on;
plot(X,Y1,S1);
plot(X,Y2,S2);
plot(X,Y3,S3);

% Example: title, grid, xlabel, ylabel, legend
X = linspace(0, 2*pi, 100);
Y1 = sin(X);
Y2 = cos(X);
Y3 = sin(2 * X);
S1 = 'go-.';
S2 = 'r+:';
S3 = 'm*--';
figure(8);
hold on;
plot(X,Y1,S1);
plot(X,Y2,S2);
plot(X,Y3,S3);
title('Trig functions');
grid on;  % grid minor;
xlabel('$x$');
ylabel('$y$');
lgd = legend({'$\sin(x)$', '$\cos(x)$', '$\sin(2x)$'}, 'Location', 'best');
lgd.Interpreter = 'latex';
axis([0, 2*pi, -1, 1]);

% Example: gcf, gca, get, set
X = linspace(0, 2*pi, 100);
Y = sin(X);
figure(9);
plot(X, Y);
axis([0, 2*pi, -1, 1]);
get(gcf)
get(gca)
c = get(gca,'Children');
get(c)
set(get(gca, 'Title'), 'String', 'sin(x)');
set(c, 'LineWidth', 1.0,...
       'LineStyle', ':',...
       'Marker', 'd',...
       'MarkerSize', 4,...
       'MarkerEdgeColor', 'y',...
       'MarkerFaceColor', 'r');
set(gca, 'XTick', [0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
set(gca, 'XTickLabel', {'0', '$\pi/2$', '$\pi$', '$3 \pi / 2$', '$2\pi$'});

% Example: subplot
X = linspace(0, 2*pi, 100);
Y1 = sin(X); Y2 = cos(X);
Y3 = sin(2 * X); Y4 = cos(2 * X);
figure(10);
subplot(2, 2, 1); plot(X,Y1,'gd-'); title('$\sin(x)$');
subplot(2, 2, 2); plot(X,Y2,'ro:'); title('$\cos(x)$');
subplot(2, 2, 3); plot(X,Y3,'ch-.'); title('$\sin(2x)$');
subplot(2, 2, 4); plot(X,Y4,'b<--'); title('$\cos(2x)$');

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