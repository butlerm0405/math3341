function [val] = gauss_quad(f, N)
%GAUSSQUAD Perform Gauss quadrature on [-1, 1]
% INPUT:
%   f = f(x) to integrate,
%   N = number of legendre points to use
% OUTPUT:
%   val = integral of f(x)

[x, w] = legendre_pair(N);

% Calculate the integral on interval [-1, 1]
val = dot(w, f(x));
% val = 0;
% for j = 1:N
%     val = val + w(j) * feval(f, x(j));
% end

end

