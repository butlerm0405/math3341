function [N, y] = newton_divided_difference(xdata, ydata, x)

n = length(xdata);
N = zeros(n);

for j = 1:n
    if j == 1
        N(:, j) = ydata;
        continue;
    end
    for i = j:n
        N(i, j) = (N(i, j - 1) - N(i - 1, j - 1)) / (xdata(i) - xdata(i - j + 1));
    end
end

y = 0;
p = 1;
for i = 1:n
    if i > 1
        p = p * (x - xdata(i - 1));
    end
    y = y + N(i, i) * p;
end

end