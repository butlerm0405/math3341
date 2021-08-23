clc; clear; format compact

% Compare two scalars:
2 <= 2
2 >= 2
2 > 1
2 ~= 1
2 == 1
'a' == "a"
'a' == 'b'
'a' ~= 'b'
'abc' == "abc"

% Compare a vector to a scalar:
x = [0,1,2,3,4,5,6]
x < 3
x <= 3
x > 3
x >= 3
x == 3
x ~= 3

% Evaluate a piecewise function
x = [0,1,2,3,4,5,6]
x < 3
f = x + 2
x >= 3
g = 6 - x
fx = f .* (x < 3)
gx = g .* (x >= 3)
hx1 = fx + gx

% Compare two vectors
x = [1,2,3,4,5,6]
y = [3,2,1,6,5,4]
x == y
x ~= y
x > y
x >= y
x < y
x <= y
'abc' == ['a', 'b', 'c']
'abc' == ['a', 'b', 'd']

% Check whether n = 5 is even
n = 5;
if mod(n, 2) == 0
    disp('n = 5 is an evem number');
else
    disp('n = 5 is an odd number');
end

% Check whether year is a leap year
isLeapYear(2008)
isLeapYear(2010)
isLeapYear(1700)
isLeapYear(1600)

% Check whether day is a weekday (buggy)
isWeekday1('Tuesday')
isWeekday1('Friday')
isWeekday1('Sunday')
isWeekday1('Sunnyday')

%  Check whether day is a weekday
isWeekday2('Tuesday')
isWeekday2('Friday')
isWeekday2('Sunnyday')

% Repeat `disp('Repeating is BORING!')` 100 times
for i = 1:100
    disp('Repeating is BORING!')
end

% Repeat `disp('Repeating is BORING!')` 100 times
i = 1;
while i <= 100
    disp('Repeating is BORING!')
    i = i + 1;
end

% Anonymous function of one variable
f = @(y) sin(y)
f([0,1,2,3,4])

% Anonymous function of two variables
g = @(x, y) x.^2 + y.^2 - 1
x = linspace(-1, 1, 10)'
y = linspace(-1, 1, 10)'
gxy = g(x, y)

% Composition of anonymous functions
h = @(z) exp(f(z))
a = linspace(0, 1, 5)
h(a)

% Define piecewise anonymous function
x = [0,1,2,3,4,5,6]
h = @(y) (y + 2) .* (y < 3) + (6 - y) .* (y >= 3)
hx2 = h(x)

% sumProd
sumProd(x)
sumProd([1,2,3])