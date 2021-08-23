function [I] = trapezoidal(f, a, b, n)
%TRAPEZOIDAL: Trapezoidal Rule
% Syntax: [I] = trapezoidal(f, x, h, M)
% Inputs:
%   f = a function handle, the function of which the derivative will be evaluated
%   a = a scalar, the lower limit
%   b = a scalar, the upper limit
%   n = a scalar, the number of points
% Outputs:
%   I = a scalar, the integral of f over a to b using n points
%
% Author: first_name last_name
% Date: 04/20/2020

x = linspace(a, b, n);
dx = x(2) - x(1);
N = length(x) - 1;
I = 0;
for i = 1:N
    I = I + dx / 2 * (f(x(i)) + f(x(i + 1)));
end

end
