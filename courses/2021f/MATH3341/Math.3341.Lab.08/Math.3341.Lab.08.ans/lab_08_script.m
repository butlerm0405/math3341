% Math 3341, Fall 2021
% Lab 08: MATLAB Interpolation Routines and Their Derivatives
% Author: Melissa Butler
% Date: 10/11/2021

clc; clear; close all;

% Change default text interpreter to LaTeX
set(groot, 'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')


%% Homework 5, Problem 1 function
f = @(x) (1 + 16 * x.^2).^(-1);
f1 = @(x) -(1 + 16 * x.^2).^(-2) * 32 .* x;                                     % f'(x)
f2 = @(x) 2 * (1 + 16 * x.^2).^(-3) .* (32 * x).^2 -(1 + 16 * x.^2).^(-2) * 32; % f''(x)

x = linspace(-1, 1, 100);
y = f(x);
y1 = f1(x);      % yvals for f'(x)
y2 = f2(x);      % yvals for f''(x)
n = 9;           % degree of polynomial desired
N = n+1;         % number of nodes needed

% Generate set of equispaced nodes
xdata = linspace(-1, 1, N);
ydata = f(xdata);
ydata1 = f1(xdata);
ydata2 = f2(xdata);

%% 1 Polynomial Interpolation Routines

% 1(a) Using polyfit and polyval
p_coeff = polyfit(xdata, ydata, n);
p_yvals = polyval(p_coeff, x);

% 1(b) Using spline
sp = spline(xdata, ydata, x);

% 1(c) Using pchip
pc = pchip(xdata, ydata, x);

% 1(d) Using your own Lagrange interpoltation polynomial function
lp = lagrange(xdata, ydata, x);

%% 2 Derivatives of interpolation polynomials

% 2(a) find 1st derivative using polyder
pd1_coeff = polyder(p_coeff);
pd1_yvals = polyval(pd1_coeff, x);

% 2(b) find 2nd derivative using polyder
pd2_coeff = polyder(pd1_coeff);
pd2_yvals = polyval(pd2_coeff, x);

% 2(c) Derivatives of spline

% stores structure of spline
cs_struct = spline(xdata, ydata);
% store the coefficients of the derivative
b = cs_struct.coefs(:,3);
c = cs_struct.coefs(:,2);
d = cs_struct.coefs(:,1);

% find 1st derivative of spline
sp_d1 = cubic_spline_der(b, c, d, xdata, x, 1);

% find 2nd derivative of spline
sp_d2 = cubic_spline_der(b, c, d, xdata, x, 2);

%% 3 Plot interpolation polynomials
figure(1);
% set figure window to full screen
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

% plot polyfit interpolation polynomial
subplot(2,2,1);
plot(x, y,'LineWidth',2)                        % plot original function
hold on
plot(x, p_yvals,'-','LineWidth',1)              % plot interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
title('Using polyfit function','FontSize',14)
xlabel('$x$'); ylabel('$p(x)$');
legend({'$f(x)$','$p(x)$','Data Points'},'FontSize',12,'Location','best')

% plots spline interpolation polynomial
subplot(2,2,2);
plot(x, y,'LineWidth',2)                        % plot original function
hold on
plot(x, sp,'-','LineWidth',1)                   % plot spline interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
title('Using spline function','FontSize',14)
xlabel('$x$'), ylabel('$s(x)$')
legend({'$f(x)$','$s(x)$','Data Points'},'FontSize',12,'Location','best')

% plots pchip interpolation polynomial
subplot(2,2,3);
plot(x, y,'LineWidth',2)                        % plot original function
hold on
plot(x, pc,'-','LineWidth',1)                   % plot spline interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
title('Using pchip function','FontSize',14)
xlabel('$x$'), ylabel('$h(x)$')
legend({'$f(x)$','$h(x)$','Data Points'},'FontSize',12,'Location','best')

% plots your lagrange interpolation polynomial
subplot(2,2,4);
plot(x, y,'LineWidth',2)                        % plot original function
hold on
plot(x, lp,'-','LineWidth',1)                   % plot interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
title('Using my Lagrange Interpolation function','FontSize',14)
xlabel('$x$'), ylabel('$l(x)$')
legend({'$f(x)$','$l(x)$','Data Points'},'FontSize',12,'Location','best')

%% 4 Plot derivatives
figure(2);
% set figure window to full screen
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

% plot polyfit interpolation polynomial
subplot(2,3,1); hold on;
plot(x, y,'LineWidth',2)                        % plot original function
plot(x, p_yvals,'-','LineWidth',1)              % plot interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
axis([-1 1 -0.2 1])
title('Using polyfit function','FontSize',14)
xlabel('$x$'), ylabel('$p(x)$')
legend({'$f(x)$','$p(x)$','Data Points'},'FontSize',12,'Location','best')

% plots 1st derivative of polyfit interpolation polynomial
subplot(2,3,2); hold on;
plot(x, y1,'LineWidth',2)                       % plot original function
plot(x, pd1_yvals,'-','LineWidth',1)            % plot interp. polynomial
plot(xdata, ydata1,'ko','MarkerSize',8)         % plot nodes
axis([-1 1 -8 8])
title('First Derivative of Polynomial $p(x)$','FontSize',14)
xlabel('$x$'), ylabel('$p''(x)$')
legend({'$f''(x)$','$p''(x)$','Data Points'},'FontSize',12,'Location','best')

% plots 2nd derivative of polyfit interpolation polynomial
subplot(2,3,3); hold on;
plot(x, y2,'LineWidth',2)                       % plot original function
plot(x, pd2_yvals,'-','LineWidth',1)            % plot interp. polynomial
plot(xdata, ydata2,'ko','MarkerSize',8)         % plot nodes
axis([-1 1 -33 15])
title('Second Derivative of Polynomial $p(x)$','FontSize',14)
xlabel('$x$'), ylabel('$p''''(x)$')
legend({'$f''''(x)$','$p''''(x)$','Data Points'},'FontSize',12,'Location','best')

% plots spline interpolation polynomial
subplot(2,3,4); hold on;
plot(x, y,'LineWidth',2)                        % plot original function
plot(x, sp,'-','LineWidth',1)                   % plot spline interp. polynomial
plot(xdata, ydata,'ko','MarkerSize',8)          % plot nodes
axis([-1 1 -0.2 1])
title('Using spline function','FontSize',14)
xlabel('$x$'), ylabel('$s(x)$')
legend({'$f(x)$','$s(x)$','Data Points'},'FontSize',12,'Location','best')

% plots 1st derivative of spline interpolation polynomial
subplot(2,3,5); hold on;
plot(x, y1,'LineWidth',2)                       % plot original function
plot(x, sp_d1,'-','LineWidth',1)                % plot spline interp. polynomial
plot(xdata, ydata1,'ko','MarkerSize',8)         % plot nodes
axis([-1 1 -8 8])
title('First Derivative of Piecewise Polynomial $s(x)$','FontSize',14)
xlabel('$x$'), ylabel('$s''(x)$')
legend({'$f''''(x)$','$s''(x)$','Data Points'},'FontSize',12,'Location','best')

% plots 2nd derivative of spline interpolation polynomial
subplot(2,3,6); hold on;
plot(x, y2,'LineWidth',2)                       % plot original function
plot(x, sp_d2,'-','LineWidth',1)                % plot spline interp. polynomial
plot(xdata, ydata2,'ko','MarkerSize',8)         % plot nodes
axis([-1 1 -33 15])
title('Second Derivative of Piecewise Polynomial $s(x)$','FontSize',14)
xlabel('$x$'), ylabel('$s''''(x)$')
legend({'$f''''(x)$','$s''''(x)$','Data Points'},'FontSize',12,'Location','best')

% save plots
for i = 1:2
    fig = figure(i);
    fig.PaperPositionMode = 'auto';
    pos = fig.PaperPosition;
    fig.PaperSize = [pos(3) pos(4)];
    filename = sprintf('lab_08_figure_0%d.pdf', i);
    print(fig, '-dpdf', filename)
end