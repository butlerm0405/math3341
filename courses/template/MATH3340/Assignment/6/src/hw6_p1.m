% MATH 3340, Fall 2020
% Homework 6, Problem 1
% Author: Libao Jin
% Date: 10/28/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

%% 1
xdata = [1.0; 1.5; 1.9; 2.4];
ydata = [1.1; 1.7; 2.1; 1.8];
x = [1.3, 1.7];
[y, C] = cubic_spline(xdata, ydata, x)
f0 = polyval(C(1, :), 1.1 - 1.0)
f1 = polyval(C(1, :), 1.3 - 1.0)
f2 = polyval(C(2, :), 1.7 - 1.5)

cs = spline(xdata, ydata);
cs.coefs


polyval(C(3,:), 0.5)
polyval(cs.coefs(3,:), 0.5)