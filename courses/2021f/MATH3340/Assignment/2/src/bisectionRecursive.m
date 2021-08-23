function [r, iters] = bisectionRecursive(f, xL, xR)

%BISECTIONRECURSIVE: Recursive Bisection Method
% Syntax: [r, iters] = bisectionRecursive(f, xL, xR)
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

tol = 1e-5;
r = 0;
iters = 0;
xM = (xL + xR) / 2;

if abs(f(xL)) < tol
    r = xL;
    return
elseif abs(f(xR)) < tol
    r = xR;
    return
elseif f(xL) * f(xR) > 0
    disp('The prerequisite of using bisection method is not satisified')
    return
elseif abs(f(xM)) < tol
    r = xM;
    iters = 0;
    return
end

if f(xL) * f(xM) < 0
    [r, iters] = bisectionRecursive(f, xL, xM);
else
    [r, iters] = bisectionRecursive(f, xM, xR);
end
iters = iters + 1;

end
