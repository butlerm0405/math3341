function [y, coefs] = cubic_spline(xdata, ydata, x, boundary_condiction_option)
%CUBIC_SPLINE: Cubic Spline Interpolants
%
% Syntax: [y, coefs] = cubic_spline(xdata, ydata, x, bc)
% Inputs:
%   xdata = a vector, the set of nodes x_k
%   ydata = a vector, the values of f at x_k, i.e., y_k = f(x_k)
%   x     = a vector, the set of points (fine grid) used to evaluate p(x)
%   boundary_condition_option = a scalar:
%             0 for natural boundary condition
%             1 for the boundary condition stated in the problem statement
% Outputs:
%   y     = a vector, the values of y at the points x
%   coefs = a matrix, coefficient matrix of which the columns are d, c, b, a.
%
% Author: first_name last_name
% Date: mm/dd/yyyy


% PUT YOUR CODE HERE

end
