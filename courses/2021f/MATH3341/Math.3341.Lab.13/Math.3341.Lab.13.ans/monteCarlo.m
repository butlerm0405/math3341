function I = monteCarlo(f, checker, xmin, xmax, ymin, ymax, N)
%MONTECARLO Monte Carlo Integration of f(x, y)
% Input:
%       f: function handle, the integrand of the integral
% checker: function handle, set the function value to zero if the points (x, y) is outside the region
%    xmin: scalar value
%    xmax: scalar value
%    ymin: scalar value
%    ymax: scalar value
%       N: scalar value, number of samples
% Output:
%       I: the integral of f(x, y) over the specific region

x = rand(N, 1) * (xmax - xmin) + xmin;
y = rand(N, 1) * (ymax - ymin) + ymin;
V = (ymax - ymin) * (xmax - xmin);
g = @(x, y) f(x, y) .* checker(x, y);
I = V / N * sum(g(x, y));

end
