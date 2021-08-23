% MATH 3340 Final Test

% Problem 1
f = @(x) [x(1).^2 + x(2).^2 + x(3).^2 - 1; x(1).^2 + x(2).^2 - x(3).^2; x(1) - x(2)];
df = @(x) [2 * x(1), 2 * x(2), 2 * x(3); 2 * x(1), 2 * x(2), -2 * x(3); 1, -1, 0];
x0 = [0.1; 0.2; 0.3];
res0 = norm(f(x0));
df0 = df(x0)
f0 = f(x0)
dx = df(x0) \ f(x0)
x1 = x0 - df(x0) \ f(x0)
f1 = f(x1)
res1 = norm(f(x1));
fprintf("%10.6f %10.6f\n", res0, res1);

% Problem 2
x = 0:5;
y = [-7, -4, 5, 26, 65, 128];
p = polyfit(x, y, length(x) - 1);
fprintf("%10d %10.6f\n", length(p) - 1, p(1));

% Problem 3
f = @(x) x.^2 - 2.6 * x - 2.31;
a = 3;
b = 4;
[r, iters] = bisection(f, a, b)

% Problem 4
f = @(x) 7 + 14 * x.^6;
a = 0;
b = 1;
R = romberg(f, a, b, 3)
