function [m, fm] = golden_section(f, a, b, tol)

%GOLDEN_SECTION: Find the minimum of function f on [a, b] using
% Golden Section Search Method.
%
% Syntax: [m, fm] = golden_section(f, a, b, tol)
% Inputs:
%   f   = function of which the minimum is desired, function handle
%   a   = left endpoint of the interval
%   b   = right endpoint of the interval
%   tol = tolerance
% Outputs:
%   m   = the minimizer at which the minimum of f(x) can be obtained
%   fm  = the minimum of the function
% Author: Libao Jin
% Date: 05/04/2021

r = (3 - sqrt(5)) / 2;
s = 1 - r;
it = 0;
while abs(b - a) > tol
    m1 = a + r * (b - a);
    m2 = a + s * (b - a);
    if f(m1) < f(m2)
        b = m2;
    else
        a = m1;
    end
    it = it + 1;
end
m = a;
fm = f(m);
end
