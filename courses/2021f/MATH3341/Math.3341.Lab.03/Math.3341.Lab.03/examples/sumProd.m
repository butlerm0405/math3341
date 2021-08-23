function [summation, product] = sumProd(x)
% SUMPROD Calculate the summation and product of all elements in x
% Syntax:
%   [summation, product] = sumProd(x)
%   summation = sumProd(x)

% Initialize variables summation and product
summation = 0;
product = 1;
for i = 1:length(x)
    summation = summation + x(i);
    product = product * x(i);
end

end
