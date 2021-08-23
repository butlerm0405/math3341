function I = monteCarlo(f, checker, xmin, xmax, ymin, ymax, zmin, zmax, M)
%MONTECARLO: Monte Carlo Integration of f(x, y)
% Input:
%       f: function handle, the integrand of the integral
% checker: function handle, set the function value to zero if the points (x, y, z) is outside the region
%    xmin: scalar value, lower bound of x coordinate of the bounding box for the region
%    xmax: scalar value, upper bound of x coordinate of the bounding box for the region
%    ymin: scalar value, lower bound of y coordinate of the bounding box for the region
%    ymax: scalar value, upper bound of y coordinate of the bounding box for the region
%    zmin: scalar value, lower bound of z coordinate of the bounding box for the region
%    zmax: scalar value, upper bound of z coordinate of the bounding box for the region
%       M: scalar value, number of samples
% Output:
%       I: the integral of f(x, y, z) over the specific region
% Author: Libao Jin
% Date: 11/23/2020

x = rand(M, 1) * (xmax - xmin) + xmin;
y = rand(M, 1) * (ymax - ymin) + ymin;
z = rand(M, 1) * (zmax - zmin) + zmin;
g = @(x, y, z) checker(x, y, z) .* f(x, y, z);
V = (zmax - zmin) * (ymax - ymin) * (xmax - xmin);
I = V / M * sum(g(x, y, z));

end
