function error = lab_12_compare_integral(FS, x, FH, bound, I_romberg, n)
%LAB_12_COMPARE_INTEGRAL Compares symbolic integral, built-in function
%   integral and romberg integral.
%
%   SYNTAX:
%   LAB_12_COMPARE_INTEGRAL(FS, x, FH, bound, I_romberg) outputs the integral
%     obtained by the symbolic integration, built-in function `integral` and
%     student's implemented function `lab_12_romberg`.
%
%   INPUT:
%          FS: the symbolic function
%           x: the symbol for the symbolic function FS
%       bound: a 1-by-2 vector, bound(1) is lower bound, bound(2)is upper bound
%   I_romberg: a 1-by-n vector, obtained by calling `lab_12_romberg`
%           n: number of subintervals used in romberg integration
%
%   OUTPUT:
%       error: the error between symbolic integration and romberg integration
%
%   Created for Math 3341 Lab 12 by Libao Jin

% Calculate the exact solution using symbolic integration
I_exact = vpaintegral(FS, x, bound(1), bound(2));
% Calculate the approximate solution using built-in function integral
I_integral = integral(FH, bound(1), bound(2));
% Print out the result of comparison
fprintf('Exact solution: %21.18f\n', I_exact);
fprintf('Using integral: %21.18f, Error: %12.5e\n', I_integral, abs(I_exact - I_integral));
fprintf('Romberg integration:\n');
error = abs(I_romberg - I_exact);
result = [1:n'; I_romberg'; error'];
fprintf('N = %2d, I = %21.18f, Error:%12.5e\n', result);
end