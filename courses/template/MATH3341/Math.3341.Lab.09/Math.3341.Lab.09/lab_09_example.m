% MATH 3341
% Examples

clear; clc;
% Hilbert Matrix
n = 5;
% n = 13;
H = hilb(n)
b = rand(n, 1)
x = invhilb(n) * b
x1 = H \ b
x2 = inv(H) * b
norm(x - x1)
norm(x - x2)

% Norm
a = rand(10, 1) * 2 - 1    % uniformly distributed on [-1, 1]
a_norm_1 = norm(a, 1)
a_norm_2 = norm(a, 2)
a_norm_inf = norm(a, 'inf')

% 2-norm Condition number
A = magic(3)
A_cond = cond(A, 2)
A_cond_1 = norm(A, 2) * norm(inv(A), 2)

% Ways to calculate sum
a = rand(5, 1)
s1 = 0
for i = 1:length(a)
    s1 = s1 + a(i);
end
s1

s2 = sum(a)

b = ones(size(a))
s3 = dot(a, b)

% IEEE - 754: https://babbage.cs.qc.cuny.edu/IEEE-754/
realmax('single')         % 32-bit max
1.9999999 * 2^(2^7 - 1)
realmin('single')         % 32-bit min
1.9999999 * 2^(-(2^7 - 1))
realmax('double')         % 64-bit max
1.9999999 * 2^(2^10 - 1)
realmin('double')         % 64-bit min
1.9999999 * 2^(-(2^10 - 1))

% Infinity in MATLAB
realmax('double') + 1e291
realmax('double') + 1e292
Inf - 1e292

% Finite Precision
a = 1234567891012345678901234567890
b = 1234567891012345678901234567890 + 1
a - b

