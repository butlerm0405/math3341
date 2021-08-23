% MATH 3340, Fall 2020
% Homework 8, Problem 1
% Author: first_name last_name
% Date: 11/23/2020

clear; close all; clc; format long;
% PUT YOUR CODE HERE
f = @(x) (x.^3 - 1) .* exp(-x.^2);
a = 1;
b = 3;
n = 3;
[I, R] = romberg(f, a, b, n)
format compact; format short;