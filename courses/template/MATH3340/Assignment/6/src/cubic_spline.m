function [p, C] = cubic_spline(xdata, ydata, x)
%CUBIC_SPLINE: Cubic Spline Interpolants
% Syntax: [p] = cubic_spline(xdata, ydata, x)
% Inputs:
%   xdata = a vector, the set of nodes x_k
%   ydata = a vector, the values of f at x_k, i.e., y_k = f(x_k)
%   x     = a vector, the set of points (fine grid) used to evaluate p(x)
% Outputs:
%   p     = a vector, the values of p at the points x
%
% Author: first_name last_name
% Date: 10/28/2020

n = length(xdata);
h = diff(xdata);
A = zeros(n, n);
rhs = zeros(n, 1);
a = ydata;
for i = 1:n
    if i == 1 || i == n
        A(i, i) = 1;
        rhs(i) = 0;
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

C = [a(1:(n - 1)) b(1:(n - 1)) c(1:(n - 1)) d(1:(n - 1))];
C = fliplr(C);
p = y;

end
