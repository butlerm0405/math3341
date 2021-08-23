% MATH 3340, Fall 2020
% Homework 6, Problem 4
% Author: Libao Jin
% Date: 10/28/2020

clear; close all; clc;
% Change default text interpreter to LaTeX
set(groot,'defaultTextInterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex')

% d = [-1 0 2 3];
% A = [1, 1, 1, 1;
%      -1, 0, 2, 3;
%      1/2, 0, 2, 9/2;
%      -1/6, 0, 8/6, 27/6];

d = [-2 -1 2 3];
n = length(d);
A = zeros(n);
for i = 1:n
    A(i, :) = d.^(i - 1) / factorial(i - 1);
end
A

b1 = [0 1 0 0]';
b2 = [0 0 1 0]';

fprintf('--------------- Problem 4 ---------------');
format rat;
c1 = A \ b1
c2 = A \ b2
format long;
c1 = A \ b1
c2 = A \ b2
