function [I] = simpson(f, a, b, n)
%SIMPSON: Simpson's Rule
% Syntax: [I] = simpson(f, a, b, n)
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
N = length(x) - 2;
I = 0;
for i = 1:2:N
    I = I + dx / 3 * (f(x(i)) + 4 * f(x(i + 1)) + f(x(i + 2)));
end

end
