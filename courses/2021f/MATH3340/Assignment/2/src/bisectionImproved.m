function [r, iters] = bisectionImproved(f, xL, xR)

%BISECTIONIMPROVED: Improved Bisection Method
% Syntax: [r, iters] = bisectionImproved(f, xL, xR)
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

r = 0;
iters = 0;
tol = 1e-5;

if f(xL) < tol
    r = xL;
    return
elseif f(xR) < tol
    r = xR;
    return
elseif f(xL) * f(xR) > 0
    disp('The prerequisite of using bisection method is not satisfied');
end
xM = (xL + xR) / 2;
while abs(f(xM)) > tol
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
