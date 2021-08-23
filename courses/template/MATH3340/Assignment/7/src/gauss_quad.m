function [I] = gauss_quad(f, a, b, N)
%gauss_quad: Gauss Quadrature on a general interval [a, b]
% Syntax: [I] = gauss_quad(f, a, b, N)
% Inputs:
%   f = the integrand (function handle)
%   a = lower limit of the integral (scalar)
%   b = upper limit of the integral (scalar)
%   N = the number of Gauss nodes (scalar)
% Outputs:
%   I = the values of the integration (scalar)
%
% Author: Libao Jin
% Date: 11/11/2020

% PUT YOUR CODE HERE
g = @(x) f((b - a) / 2 * x + (b + a) / 2) * (b - a) / 2;
[x, w] = legendre_pair(N);
I = dot(w, g(x));

end
