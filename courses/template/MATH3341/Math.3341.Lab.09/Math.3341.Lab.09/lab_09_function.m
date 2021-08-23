function lab_09_function(n)

% 1(b): Generate an n-by-n Hilbert matrix A

% 1(c): Create an n-by-1 all-one vector b

% 1(d): Solving the system Ax = b
% Find the exact solution using `invhilb`

% Find the approximate solution using `\`

% Find approximate solution using `inv`

% 1(e): Calculate relative error of each solution
% relative error of solution obtained by `\` in infinity norm

% relative error of solution obtained by `inv` in infinity norm

% 1(f): Calculate the condition number of A

% Print results
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
