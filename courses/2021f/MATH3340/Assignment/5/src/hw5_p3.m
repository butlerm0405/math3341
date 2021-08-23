% MATH 3340, Spring 2020
% Homework 5, Problem 3
% Author: Libao Jin
% Date: 04/01/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

% Problem 3
x = 0.35;
xdata = [0.1 0.3 0.5 0.7]';
ydata = [1.01 1.35 2.11 2.95]';
fprintf('--------------- Problem 3 ---------------');
[N, y] = newton_divided_difference(xdata, ydata, x);
[xdata N]
y
