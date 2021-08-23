function [fp1, fpp1, fp2, fpp2] = central_difference(f, t, h)
fp1 = (-f(t + 2 * h) + 8 * f(t + h) - 8 * f(t - h) + f(t - 2 * h)) ./ (12 * h);
fpp1 = (-f(t + 2 * h) + 16 * f(t + h) - 30 * f(t) + 16 * f(t  - h) - f(t - 2 * h)) ./ (12 * h .^ 2);
fp2 = (f(t + h) - f(t - h)) ./ (2 * h);
fpp2 = (f(t + h) - 2 * f(t) + f(t - h)) ./ (h.^2);
end