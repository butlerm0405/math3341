function f = factorialRecursive(n)

if n == 0
    f = 1;
else
    f = n * factorialRecursive(n - 1);
end

end