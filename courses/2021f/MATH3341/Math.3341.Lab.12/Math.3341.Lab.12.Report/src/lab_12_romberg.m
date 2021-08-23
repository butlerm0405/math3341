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

h = b - a;
R = zeros(n);
R(1, 1) = (f(a) + f(b)) * h / 2;
for k = 2:n
    R(k, 1) = (R(k - 1, 1) + h * sum(f(a + (2 * (1:2^(k-2)) - 1) * h / 2))) / 2;
    for j = 2:k
        R(k, j) = R(k, j - 1) + (R(k, j - 1) - R(k - 1, j - 1)) / (4^(j - 1) - 1);
    end
    h = h / 2;
end
val = diag(R);
end