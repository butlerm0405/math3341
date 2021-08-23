function [S] = cubic_spline_der(b, c, d, xdata, x, order)
%CUBIC_SPLINE_DER
% Evaluates derivative of cubic spline given coeffs
%
% INPUT: b,c,d = coeffs of cubic spline
%        xdata = node values/data points
%            x = vector of x values to evaluate S'(x)
%        order = order of derivative 1 == S'(x), 2 == S''(x)
% OUTPUT: S = vector of cubic spline derivative values.

S = zeros(length(x), 1);
n = length(xdata) - 1;
N = length(xdata); % value of n + 1

% create vector of index locations in x
index = zeros(1, N);
for i = 1:N
    index(i) = find(x == xdata(i));
end

if order == 1
    for j = 1:n
        for k = index(j):index(j+1)
            S(k) = b(j) + 2 * c(j) .* (x(k) - xdata(j)) + 3*d(j).*(x(k) - xdata(j))^2;
        end
    end
elseif order == 2
    for j = 1:n
        for k = index(j):index(j+1)
            S(k) = 2 * c(j) + 6 * d(j) .* (x(k) - xdata(j));
        end
    end
else
    fprintf('not a valid derivative order')
end

end
