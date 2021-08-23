function [m, fm] = successive_parabolic(f, a, b, tol)

%SUCCESSIVE_PARABOLIC: Find the minimum of function f on [a, b] using
% Successive Parabolic Interpolation.
%
% Syntax: [m, fm] = successive_parabolic(f, a, b, tol)
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
%
m = rand * (b - a) + a;
while f(m) >= f(a) || f(m) >= f(b)
    m = rand * (b - a) + a;
end

while abs(b - a) >= tol
    fm = f(m);
    fa = f(a);
    fb = f(b);
    xm = m + 1 / 2 * ((fa - fm) * (b - m)^2 - (fb - fm) * (m - a)^2) / ((fa - fm) * (b - m) + (fb - fm) * (m - a));
    if xm == m
        break
    elseif xm < m
        if f(xm) < fm
            b = m;
            m = xm;
        else
            a = xm;
        end
    else
        if f(xm) < fm
            a = m;
            m = xm;
        else
            b = xm;
        end
    end
end

end
