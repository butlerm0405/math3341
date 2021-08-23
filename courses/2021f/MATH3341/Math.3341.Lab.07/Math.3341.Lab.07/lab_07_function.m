function [X, iter, res] = sor(A, b, x0, w, tol, maxIter)

[row, col] = size(A);
n = length(b);
x = x0;

% Check the size of inputs
if (row ~= n) || (col ~= n) disp('Error'); return; end

% Successive over-relaxation method
while res(iter + 1) >= tol || iter <= maxIter
for j = 1:n
for k = 1:j
if k < j
s = s + A(j,k) * x(k)
else
s = s + A(j,k) * x(k)
end
end
x(j) = (1 - w) * x(j) + w / A(j,j) * (b(j) - s)
end
% Check the norm of the residual
res(iter) = norm(A * x - b)
X(iter, :) = x
x = x0
end

end
