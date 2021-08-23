function [X, iter, res] = lab_07_function(A, b, x0, w, tol, maxIter)

[row, col] = size(A);
n = length(b);
x = x0;

% Check the size of inputs
if (row ~= n) || (col ~= n)
    disp('Error');
    return;
end

iter = 0;
X(1, :) = x;
r = A * x - b;
res(1) = norm(r);

% Successive over-relaxation method
while res(iter + 1) >= tol && iter <= maxIter
    iter = iter + 1;
    for i = 1:n
        s = 0;
        for j = 1:n
            if j < i
                s = s + A(i,j) * x(j);
            elseif j > i
                s = s + A(i,j) * x0(j);
            end
        end
        x(i) = (1 - w) * x0(i) + w / A(i,i) * (b(i) - s);
    end
    % Check the norm of the residual
    res(iter + 1) = norm(A * x - b);
    X(iter + 1, :) = x;
    x0 = x;
end

end
