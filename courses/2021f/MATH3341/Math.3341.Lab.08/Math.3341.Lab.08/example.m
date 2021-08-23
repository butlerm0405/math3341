% Example

close all; clear; clc;
% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

n = 4;
% Generate data points
xdata = 2 * rand(n, 1)' - 1;
ydata = 10 * randn(n, 1)' - 5;
% Fine grid (for plotting the polynomial)
x = linspace(-1, 1, 100)';
% Polynomial Interpolation
p = polyfit(xdata, ydata, 1)' % Polynomial interpolation 
y = polyval(p, x)               % Evaluate the derivative at fine grid
% Calculating Derivatives
dp = polyder(p)'                % Find the derivative of the polynomial
dy = polyval(dp, x)             % Evaluate the derivative at fine grid
% Plotting
figure(1); hold on;
plot(xdata, ydata, 'o');
plot(x, y, '-');
plot(x, dy, '--');
legend({'data points', 'polynomial interpolation', 'derivative'}, 'Location', 'best');
xlabel('$x$');
ylabel('$y$');

% Cubic Spline
cs = spline(xdata, ydata, x);

figure(2); hold on;
plot(xdata, ydata, 'o');
plot(x, y, '-');
plot(x, cs, '--');
legend({'data points', 'polynomial interpolation', 'cubic spline'}, 'Location', 'best');
xlabel('$x$');
ylabel('$y$');

% Cubic Spline but do not evaluate the piecewise cubic polynomial
cs = spline(xdata, ydata)  % returns a structure
cs.coefs                   % obtain the member using "." operator
