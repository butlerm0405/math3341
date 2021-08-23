f = @(x) 1 + x + x.^2 / 2 + x.^3 / factorial(3) + x.^4 / factorial(4);
x = 0:0.2:2;
error = abs(f(x) - exp(x));
fig = figure(1);
plot(x, error);
set(fig, 'PaperPositionMode', 'auto');
pos = get(fig, 'PaperPosition');
set(fig, 'PaperSize', [pos(3), pos(4)]);
print(fig, '-dpdf', 'hw1_p3_c.pdf');