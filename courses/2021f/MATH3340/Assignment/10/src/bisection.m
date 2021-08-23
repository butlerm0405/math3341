function [r, iters] = bisection(f, xL, xR)

%BISECTION: Bisection Method
% Syntax: [r, iters] = bisection(f, xL, xR)
% Inputs:
%   f  = the function f(x) for which you want to find the root
%   xL = left limit of the interval
%   xR = right limit of the interval
% Outputs:
%   r     = the root
%   iters = number of iterations performed
%
% Author: Libao Jin
% Date: 02/13/2020
%

iters = 0;
maxIters = 20000;
tol = 1e-5;
xM = (xL + xR) / 2;
while abs(f(xM)) > tol && iters < maxIters
    if f(xL) * f(xM) < 0
        xR = xM;
    else
        xL = xM;
    end
    xM = (xL + xR) / 2;
    iters = iters + 1;
end
r = xM;

end
