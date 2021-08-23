function [I, R] = romberg(f, a, b, n)

%ROMBERG
% Syntax: I = romberg(f, a, b, n)
% Inputs:
%   f = the integrand which is a function handle
%   a = the lower bound of the definite integral
%   b = the upper bound of the definite integral
%   n = number of subintervals
% Outputs:
%   I = the romberg integration of f(x) over the interval [a, b] using n subinterval
%   R = a lower triangular matrix
% Author: first_name last_name
% Date: 04/29/2020

h = b - a;
R = zeros(n);
R(1, 1) = (f(a) + f(b)) * h / 2;
for k = 2:n
    j = 1:2^(k - 2);
    R(k, 1) = 1 / 2 * (R(k - 1, 1) + h * sum(f(a + (2 * j - 1) * h / 2)));
    for j = 2:k
        R(k, j) = R(k, j - 1) + (R(k, j - 1) - R(k - 1, j - 1)) / (4^(j - 1) - 1);
    end
    h = h / 2;
end
I = R(end, end);

end
