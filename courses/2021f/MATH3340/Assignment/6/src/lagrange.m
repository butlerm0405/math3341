function [p] = lagrange(xdata, ydata, x)
%LAGRANGE: Lagrange Interpolants
% Syntax: [p] = lagrange(xdata, ydata, x)
% Inputs:
%   xdata = a column vector, the set of nodes x_k
%   ydata = a column vector, the values of f at x_k, i.e., y_k = f(x_k)
%   x     = a column vector, the set of points (fine grid) used to evaluate p(x)
% Outputs:
%   p     = a column vector, the values of p at the points x
%
% Author: Libao Jin
% Date: 10/28/2020

m = length(x);
n = length(xdata);
p = zeros(m, 1);
L = ones(m, n);
for k = 1:n
    for j = 1:n
        if j ~= k
            L(:, k) = L(:, k) .* (x - xdata(j)) / (xdata(k) - xdata(j));
        end
    end
end
for i = 1:m
    for k = 1:n
        p(i) = p(i) + ydata(k) * L(i, k);
    end
end

end
