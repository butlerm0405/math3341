function [x, iters, res] = gaussSeidel(A, b, x0, maxIter, tol)
%GAUSSSEIDEL: Gauss-Seidel Method
% Syntax: [x, iters] = gaussSeidel(A, b, x0, maxIter, tol)
% Inputs:
%   A       = coefficient matrix (matrix)
%   b       = right-hand side vector (column vector)
%   x0      = solution to the linear system (column vector)
%   maxIter = maximum of number of iterations (scalar)
%   tol     = tolerance (scalar)
% Outputs:
%   x     = solution to the linear system (matrix, i-th column is the solution in the i-th iteration)
%   iters = number of iterations performed (vector)
%   res   = norm of residuals (vector)
%
% Author: Libao Jin
% Date: 10/04/2020


L = tril(A);
U = triu(A, 1);
x = [x0];
iters = [0];
res = [norm(b - A * x0)];
i = 0;
while i <= maxIter && res(end) > tol
    x0 = L \ (b - U * x0);
    res = [res norm(b - A * x0)];
    x = [x x0];
    i = i + 1;
    iters = [iters i];
end

end
