function Q = recursive_lagrange(xdata, ydata, x)

n = length(xdata);
Q = zeros(n);
for j = 1:n
    if j == 1
        Q(:, j) = ydata;
        continue;
    end
    for i = j:n
        Q(i, j) = ((x - xdata(i - j + 1)) * Q(i, j - 1) - (x - xdata(i)) * Q(i - 1, j - 1)) / (xdata(i) - xdata(i- j + 1));
    end
end

end