sa1 = polyval(ones(1, 6), 0.3);
syms a;
b = 1 + a + a^2 + a^3 + a^4 + a^5;
sa2 = subs(b, 0.3);
a = 0.3;
sa3 = 0;
for i = 0:5
    sa3 = sa3 + a^i;
end
sa4 = (1 - a^6) / (1 - a);
fprintf('%.20f\n%.20f\n%.20f\n%.20f\n', sa1, sa2, sa3, sa4)

s = 0;
for i = 1:10
    s = s + 0.1;
end
s

v = 0.1 * ones(10, 1)% [0.1, 0.1]
s = sum(v)