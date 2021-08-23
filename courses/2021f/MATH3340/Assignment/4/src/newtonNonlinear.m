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
% Date: 03/05/2020

x = x0;
res = norm(f(x0));
iters = 0;
while iters(end) < maxIter && res(end) > tol
    x0 = x0 - df(x0) \ f(x0);
    x = [x x0];
    res = [res; norm(f(x0))];
    iters = [iters; iters(end) + 1];
end

end
