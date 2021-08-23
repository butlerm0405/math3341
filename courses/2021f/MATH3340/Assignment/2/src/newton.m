function [r, iters] = newton(f, df, x0)

%NEWTON: Newton Method
% Syntax: [r, iters] = newton(f, df, x0)
% Inputs:
%   f  = the function f(x) for which you want to find the root
%   df = the first derivative of function f(x)
%   x0 = the initial guess
% Outputs:
%   r     = the root
%   iters = number of iterations performed
%
% Author: Libao Jin
% Date: 02/13/2020
%

r = x0;
iters = 0;
tol = 1e-5;
maxIter = 20000;
while abs(f(r)) > tol && iters < maxIter
    r = x0 - f(x0) / df(x0);
    x0 = r;
    iters = iters + 1;
end

end
