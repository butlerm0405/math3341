function [x, w] = legendre_pair(n)
%legendre_pair  Generate Gauss nodes and weights.
%   [x, w] = legendre_pair(n) calculates roots and weights of Legendre
%      polynomial of degree n. Here x and w (both vectors are of length n)
%      are also called the Gauss nodes and the corresponding weights.
%
%   Created for Math 3341 Lab 11 by Libao Jin
%   Reference: https://en.wikipedia.org/wiki/Gaussian_quadrature

syms t;
% Legendre polynomial P(t) of degree n
legendrePolynomial = legendreP(n, t);
% Calculate roots of P(t)
x = sort(real(vpa(root(legendrePolynomial, t))));
w = zeros(n, 1);
for i = 1:length(x)
    % Evaluate the derivative of Legendre polynomial P'(x(i)) at x(i)
    legendrePolyder = subs(diff(legendrePolynomial, t, 1), x(i));
    % Calculate the corresponding weight at x(i)
    w(i) = 2 / ((1 - x(i) ^ 2) * legendrePolyder ^ 2);
end
x = double(x);
w = double(w);
end
