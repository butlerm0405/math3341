clear; close all; clc; format compact;
%% Problem 1
diary('hw1_sol_p1.txt')
fprintf('\n- Problem 1 -\n')
% P1(a)
fprintf('\n- Problem 1 (a) -\n');
x = [1 - 1i; 2; 3 + 2 * 1i; 4 * 1i];
y = [2 * 1i; -1; 2 - 3 * 1i; 1 + 1i];
dot_xy = x.' * y
inner_xy = dot(x, y)
inner_xx = dot(x, x)

% P1(b)
fprintf('\n- Problem 1 (b) -\n');
D = diag([2, -5])
[U, V] = eig(D)

% P1(c)
fprintf('\n- Problem 1 (c) -\n');
A = [2 1 2; -1 1 3; -2 3 5]
B = [1 2 1; 3 7 2; 3 3 5]
x = [2; 1; 3]
Ax = A * x
AB = A * B
BA = B * A
X = x * x'

diary off;

%% Problem 2
diary('hw1_sol_p2.txt');
fprintf('\n- Problem 2 -\n')
A = [2 -3 1 7; -1 3 5 -2; 1 -1 4 2]
B = [3 2; 1 -1; 4 1; -2 5]
AB = A * B
diary off;

%% Problem 3
diary('hw1_sol_p3.txt');
fprintf('\n- Problem 3 -\n')
% P3(a)
fprintf('\n- Problem 3 (a) -\n')
hw1_p3_ex1

% P3(b)
fprintf('\n- Problem 3 (b) -\n')
hw1_p3_ex2

% P3(c)
fprintf('\n- Problem 3 (c) -\n')
hw1_p3_ex3

% P3(d)
fprintf('\n- Problem 3 (d) -\n')
hw1_p3_ex4
diary off

%% Problem 5
diary('hw1_sol_p5.txt');
fprintf('\n- Problem 5 -\n')
% P5(a)
intmin('uint64')
intmax('uint64')

% P5(b)
intmin('int64')
intmax('int64')

% P5(c)
realmin('double')
realmax('double')
diary off;
