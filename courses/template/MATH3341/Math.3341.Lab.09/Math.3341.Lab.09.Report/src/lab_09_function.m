function lab_09_function(n)

% 1(b): Generate an n-by-n Hilbert matrix A
A = hilb(n);

% 1(c): Create an n-by-1 all-one vector b
b = ones(n,1);

% 1(d): Solving the system Ax = b
% Find the exact solution using `invhilb`
x_exact = invhilb(n) * b;
% Find the approximate solution using `\`
x_backslash = A \ b;
% Find approximate solution using `inv`
x_inv = inv(A) * b;

% 1(e): Calculate relative error of each solution
% relative error of solution obtained by `\` in infinity norm
error_backslash = norm(x_backslash - x_exact, Inf) / norm( x_exact, Inf);
% relative error of solution obtained by `inv` in infinity norm
error_inv = norm(x_inv - x_exact, Inf) / norm(x_exact, Inf);

% 1(f): Calculate the condition number of A
cond_A = cond(A,1);

%% Print results
disp('-----------------------------------------')
fprintf('Hilbert Matrix with n = %d \n', n)
disp('-----------------------------------------')
fprintf(' %-11s | %-11s | % -11s \n','exact x','backslash', 'inv')
disp('-----------------------------------------')
fprintf(' % 9.4e | % 9.4e | % 9.4e \n', [x_exact, x_backslash, x_inv]')
disp('-----------------------------------------')
fprintf('Error using backslash : %8.4e\n', error_backslash);
fprintf('Error using inv       : %8.4e\n', error_inv);
fprintf('Condition number of A : %8.4e\n', cond_A);
disp('-----------------------------------------')

end
