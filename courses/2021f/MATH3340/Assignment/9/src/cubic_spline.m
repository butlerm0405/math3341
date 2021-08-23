function [y, coefs] = cubic_spline(xdata, ydata, x, bc, test)
%CUBIC_SPLINE: Cubic Spline Interpolants
%
% Syntax: [y, coefs] = cubic_spline(xdata, ydata, x, bc)
% Inputs:
%   xdata = a vector, the set of nodes x_k
%   ydata = a vector, the values of f at x_k, i.e., y_k = f(x_k)
%   x     = a vector, the set of points (fine grid) used to evaluate p(x)
%   bc    = a scalar:
%             0 for natural boundary condition
%             1 for the boundary condition stated in the problem statement
% Outputs:
%   y     = a vector, the values of y at the points x
%   coefs = a matrix, coefficient matrix of which the columns are d, c, b, a.
%
% Author: Libao Jin
% Date: 05/04/2021


n = length(xdata);
h = diff(xdata);
A = zeros(n, n);
rhs = zeros(n, 1);
a = ydata;
for i = 1:n
    if i == 1 || i == n
        A(i, i) = 1;
        if test ==  1
            rhs(i) = - bc * sin(xdata(i)) / 2;
        else
            rhs(i) = - bc * cos(xdata(i)) / 2;
        end
    else
        A(i, i - 1) = h(i - 1);
        A(i, i) = 2 * (h(i - 1) + h(i));
        A(i, i + 1) = h(i);
        rhs(i) = 3 / h(i) * (a(i + 1) - a(i)) - 3 / h(i - 1) * (a(i) - a(i - 1));
    end
end

c = A \ rhs;

b = zeros(n - 1, 1);
for i = 1:n - 1
    b(i) = 1 / h(i) * (a(i + 1) - a(i)) - h(i) / 3 * (2 * c(i) + c(i + 1));
end

d = zeros(n - 1, 1);
for i = 1:n - 1
    d(i) = (c(i + 1) - c(i)) / (3 * h(i));
end

y = zeros(size(x));
for i = 1:length(x)
    for j = 1:length(xdata) - 1
        if x(i) >= xdata(j) && x(i) <= xdata(j + 1)
            y(i) = a(j) + b(j) * (x(i) - xdata(j)) + ...
                   c(j) * (x(i) - xdata(j)) ^ 2 + ...
                   d(j) * (x(i) - xdata(j)) ^ 3;
        end
    end
end
coefs = [d(1:(n - 1)) c(1:(n - 1)) b(1:(n - 1)) a(1:(n - 1))];
end
