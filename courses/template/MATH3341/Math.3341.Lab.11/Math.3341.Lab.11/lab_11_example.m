clear; clc; format long;
% polyint
% integrate 3 * x^2 + 2 * x + 1
p = [3,2,1]
I1 = polyint(p, 1)  % [1,1,1,1]
I2 = polyint(p, 2)  % [1,1,1,2]
I3 = polyint(p)     % [1,1,1,0]
polyval(I1, 0)      % 1
polyval(I2, 0)      % 2
polyval(I3, 0)      % 0

% integrate 3 * x^2 + 2 * x + 1 on [0, 2]
p = [3,2,1]
P = polyint(p)                     % [1,1,1,0]
I = polyval(P, 2) - polyval(P, 0)  % 14

% trapz and cumtrapz
x = [1,2,3];
y = [1,2,3];
I1 = cumtrapz(x, y)                % [0, 1.5000, 4.0000]
I2 = [trapz([1], [1]),
      trapz([1,2], [1,2]),
      trapz([1,2,3], [1,2,3])]     % [0, 1.5000, 4.0000]

% integrate 3 * x^2 + 2 * x + 1 on [0, 2] using trapz
f = @(x) 3 * x.^2 + 2 * x + 1;
a = 0;
b = 2;
x = linspace(a, b, 100)';
y = f(x);
It = trapz(x, y)
Ic = cumtrapz(x, y)

% integrate 3 * x^2 + 2 * x + 1 on [0, 2] using integral
f = @(x) 3 * x.^2 + 2 * x + 1;
a = 0;
b = 2;
Ii = integral(f, a, b)

% integral2 
% \int_{0}^{2} \int_{0}^{x} 6 y + 2 dy dx
f = @(x, y) 6 * y + 2;
xmin = 0;
xmax = 2;
ymin = 0;       % same as ymin = @(x) 0;
ymax = @(x) x;
I = integral2(f, xmin, xmax, ymin, ymax);   % 12.0000

% integral3
% \int_{0}^{2} \int_{0}^{x} \int_{-2y + 2}^{4y + 4} 1  dz dy  dx
f = @(x, y, z) ones(size(z));
xmin = 0;
xmax = 2;
ymin = 0;
ymax = @(x) x;
zmin = @(x,y) -2 * y + 2;
zmax = @(x,y) 4 * y + 4;
I = integral3(f, xmin, xmax, ymin, ymax, zmin, zmax);   % 12

% legendre_pair
[x, w] = legendre_pair(2)
