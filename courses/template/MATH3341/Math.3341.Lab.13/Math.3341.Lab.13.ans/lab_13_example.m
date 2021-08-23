% Integrate f(x, y) = 1 over the disk centered at the origin with radius 1
xmin =-1;
xmax = 1;
ymin =-1;
ymax = 1;
N = 1000000;
x = rand(N, 1) * (xmax - xmin) + xmin;
y = rand(N, 1) * (ymax - ymin) + ymin;
f = @(x, y) 1;
S = @(x, y) (x^2 + y^2) <= 1;
I = 0;
for i = 1:N
    I = I + f(x(i), y(i)) * S(x(i), y(i));
end
I = I * (ymax - ymin) * (xmax - xmin) / N