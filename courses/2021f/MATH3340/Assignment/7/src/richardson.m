function [E] = richardson(f, x, h, M)
%RICHARDSON: Richardson Extrapolation
% Syntax: [E] = richardson(f, x, h, M)
% Inputs:
%   f = a function handle, the function of which the derivative will be evaluated
%   x = a scalar, the point where the derivatives are evaluated
%   h = a scalar, the initial step size
%   M = a scalar, the number of divisions of the step size
% Outputs:
%   E = a matrix, the values of the derivative
%
% Author: first_name last_name
% Date: 04/20/2020

N = @(f, t, h) (f(t + h) - f(t - h)) / (2 * h);
E = zeros(M);
for n = 1:M
    for m = 1:n
        if m == 1
            E(n, 1) = N(f, x, h / 2^(n - 1));
        else
            E(n, m) = 4^(m - 1) / (4^(m - 1) - 1) * E(n, m - 1) - 1 / (4^(m - 1) - 1) * E(n - 1, m - 1);
        end
    end
end

end
