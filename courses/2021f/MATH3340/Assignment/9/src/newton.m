function x = newton(f, df, x0, tol, maxIter)

if nargin == 3
    tol = 1e-6;
    maxIter = 1000;
elseif nargin == 4
    maxIter = 1000;
end

iter = 0;
x = x0;
while abs(f(x)) > tol && iter < maxIter
    if df(x) == 0
        x = x - f(x) * 0.01;
    else
        x = x - f(x) / df(x);
    end
    iter = iter + 1;
end

end
