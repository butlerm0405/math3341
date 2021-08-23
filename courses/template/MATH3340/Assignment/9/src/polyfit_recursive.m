function [Q] = polyfit_recursive(xdata, ydata, x)

%POLYFIT_RECURSIVE: Recursive approximation for p(x), where p is
%interpolant for fitting xdata, ydata.
% 
% Syntax: [Q] = polyfit_recursive(xdata, ydata, x)
% Inputs:
%   xdata = a vector, x-coordinates of data points (x_i's)
%   ydata = a vector, y-coordinates of data points (y_i's)
%   x     = a scalar, x-coordinate of the point at which we evaluate the polynomial
% Outputs:
%   Q     = a matrix, tabulated values of the recursive approximation for p(x)
% Author: Libao Jin
% Date: 05/04/2021

Q = zeros(5);
Q(:, 1) = ydata;
for j = 2:length(ydata)
    for i = j:length(ydata)
        Q(i, j) = ((x - xdata(i - j + 1)) * Q(i, j - 1) - (x - xdata(i)) * Q(i - 1, j - 1)) / (xdata(i) - xdata(i - j + 1));
    end
end

end
