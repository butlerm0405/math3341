f = @(x,y) ((x.^2)*y + exp(-(x.^2 + y.^2)));

a = @(x) (x.^2);
b = @(x) (4 - x.^2);
n = 4;

dy = @(x) (b(x) - a(x))/n;

fodd = @(x) 0;
feven = @(x) 0;
for i = 2: n-1;
    h = i;
    if i == 2n - 1;
        xodd =@(x) a(x) + dy(x) * h;
        fodd =@(x) f(x,xodd(x)) + fodd(x);
    else
        xeven= @(x) a(x) + dy(x)*h;
        feven = @(x) f(x, xeven(x)) +  feven(x);
    end
end

simp = @(x) ((dy(x)/3) * ((f(x, a(x)) + f(x, b(x)) + (2 * food(x))) + (4 * feven(x))));
