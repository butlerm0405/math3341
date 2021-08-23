function val = lab_12_romberg(f, a, b, n)

%LAB_12_ROMBERG Approximates the integral using Romberg technique 
% up to order O(h^(2n)) accuracy
% INPUT:
%   f:  f(x), a function handle
%   a: lower bound, a scalar
%   b: upper bound, a scalar
%   n: number of subintervals, a scalar
% OUTPUT:
%   val: diagonal elements of table, a vector of length n
%        to be more exact, val = [R(1, 1), R(2, 2), ..., R(n, n)];

% Initialization
h = ;
R = zeros(n);
R(1, 1) = ;
% Write a for-loop by following the given algorithm

val = ;
end
