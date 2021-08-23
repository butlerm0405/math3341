function p = lagrange(xdata, ydata, x)

p = zeros(size(x));
for k = 1:length(x)
    L = ones(size(ydata));
    for i = 1:length(xdata)
        for j = 1:length(xdata)
            if j ~= i
                L(i) = L(i) * (x(k) - xdata(j)) / (xdata(i) - xdata(j));
            end
        end
    end
    p(k) = dot(L, ydata);
end

end