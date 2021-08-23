% Math 3341, Fall 2021
% Lab 04: Plotting Data
% Author: Libao Jin
% Date: 09/13/2021

clear  % clears all variables
close all; % closes all figure windows

% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

%% 1 Basics of Plotting Functions
figure(1);

% 1(a)
x = -10:4:10;
y = x.^3;
subplot(2, 2, 1);
plot(x, y);
xlabel('$x$');
ylabel('$y$')
title('$y = x^3$ (step size = 4)');

% 1(b)
x = -10:0.1:10;
y = x.^3;
subplot(2, 2, 2);
plot(x, y);
xlabel('$x$');
ylabel('$y$')
title('$y = x^3$ (step size = 0.1)');

% 1(c)
t = linspace(0, 2 * pi);
x = 13 * (sin(t)).^3;
y = 13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t);
subplot(2, 2, 3);
plot(x, y, 'r-.');
xlabel('$x = 13 \sin^3{t}$');
ylabel('$y = 13 \cos{t} - 5 \cos{2t} - 2 \cos{3t} - \cos{4t}$')
title('$t \in [0, 2 \pi]$');
axis([-20, 20, -20, 20])

% 1(d)
t = linspace(-25 * pi, 25 * pi, 5000);
x = 4 * sin(24 / 25 * t);
y = 3 * sin(t);
subplot(2, 2, 4);
plot(x, y);
xlabel('$x = 4 \sin{\frac{24 t}{25}}$');
ylabel('$y = 3 \sin{t}$');
title('$t \in [-25\pi, 25\pi]$');
axis([-4, 4, -3, 3])

%% 2 Set Properties for Plots

% 2(a)
figure(2); hold on;
linestyles = {'-', '-.', ':'};
x = linspace(0, 2 * pi, 1000);
for i = -1:1
    y = sin(2^i * x);
    plot(x, y, 'LineStyle', linestyles{i + 2}, 'LineWidth', 2);
end

% 2(b)
legend({'$\sin(x/2)$', '$\sin(x)$', '$\sin(2x)$'}, 'Location', 'best');
grid on;
xlabel('$x$');
ylabel('$y$');
axis([0, 2*pi, -1, 1]);
title('Sine function');

% 2(c)
set(gca, 'XTick', [0, pi / 2, pi, 3 * pi / 2, 2 * pi]);
set(gca, 'XTickLabel', {'0', '$\pi/2$', '$\pi$', '$3 \pi / 2$', '$2\pi$'});
set(gca, 'GridLineStyle', '--');
set(gca, 'Box', 'on');
set(gca, 'BoxStyle', 'full');

%% 3 Piecewise Function on Different Scales
% 3(a)
x = 0:0.01:10;
y = (x <= 8) .* exp(8)/8 .* x +  (x > 8) .* exp(x);
figure(3);

% 3(b)
subplot(2, 2, 1);
plot(x, y);
grid minor;
xlabel('$x$');
ylabel('$y$ (linear scale)');
title('Piecewise function (linear scale)');

% 3(c)
subplot(2, 2, 2);
plot(x, y);
set(gca, 'YScale', 'log');
grid minor;
xlabel('$x$');
ylabel('$y$ (log scale)');
title('Piecewise function (log scale)');

% 3(d)
subplot(2, 2, 3);
semilogy(x, y);
grid minor;
xlabel('$x$');
ylabel('$y$ (log scale)');
title('Piecewise function (log scale)');

% 3(e)
subplot(2, 2, 4);
[hAx, hLine1, hLine2] = plotyy(x, y, x, y, 'plot', 'semilogy');
set(hLine1, 'LineStyle', '-.');
set(hLine2, 'LineStyle', '--');
grid minor;
xlabel('$x$');
ylabel(hAx(1), '$y$ (linear scale)');
ylabel(hAx(2), '$y$ (log scale)');
title('Piecewise function (mixed scales)');

%% 4 Save Plots
prefix = 'lab_04_plot_';
for i = 1:3
    name = strcat(prefix, num2str(i));       % Set filename for figure i
    fig = figure(i);                         % Set figure i as current figure window
    set(fig, 'PaperPositionMode', 'auto');   % Set paper position mode to 'auto'
    pos = get(fig, 'PaperPosition');         % Get figure window paper position
    set(fig, 'PaperSize', [pos(3) pos(4)]);  % Set figure paper size
    print(fig, '-dpdf', name);               % Save figure
end
