function [x, iters, res] = newtonNonlinear(f, df, x0, maxIter, tol)
%NEWTONNONLINEAR: Newton Method for Nonlinear System
% Syntax: [x, iters] = newtonNonlinear(f, df, x0, maxIter, tol)
% Inputs:
%   f       = function (funciton handle)
%   df      = Jacobian matrix (function handle)
%   x0      = solution to the linear system (column vector)
%   maxIter = maximum of number of iterations (scalar)
%   tol     = tolerance (scalar)
% Outputs:
%   x     = solution to the linear system (matrix, i-th column is the solution in the i-th iteration)
%   iters = number of iterations performed (vector)
%   res   = norm of residuals (vector)
%
% Author: first_name last_name
% Date: mm/dd/yyyy


end
