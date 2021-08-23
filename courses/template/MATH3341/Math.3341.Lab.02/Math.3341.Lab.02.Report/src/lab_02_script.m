% Math 3341, Fall 2021
% Lab 02: Variables, Arrays and Scripts
% Author: Libao Jin
% Date: 08/30/2021

clc             % clear command window
clear           % clear variables workspace
format compact  % show results in compact format

%% 1 1-D Array: Vector
% 1(a)
vec1 = linspace(1, 9, 9)
vec2 = 18:-2:1
vec1Length = length(vec1)
vec2Length = length(vec2)
% 1(b)
vec1Product = prod(vec1)
vecProduct = vec1 .* vec2
dotProduct1 = dot(vec1, vec2)
dotProduct2 = vec1 * vec2'
dotProduct3 = sum(vec1 .* vec2)

%% 2 2-D Array: Matrix
% 2(a)
mat1 = magic(3)
mat1ColSum = sum(mat1, 1)
mat1RowSum = sum(mat1, 2)
mat1DiagSum = sum(diag(mat1))
% 2(b)
mat2 = reshape(vec1, 3, 3)'
matProduct1 = mat1 * mat2
matProduct2 = mat1 .* mat2
% 2(c)
mat3 = [matProduct1;matProduct2]
sumAll = sum(mat3, 'all')
mat3ColMin = min(mat3, [], 1)
mat3RowMax = max(mat3, [], 2)
[rowIndex, colIndex] = find(mat3 <= 20)
% 2(d)
mat3(:, 4) = mat3(:, 2)
mat3(:, end + 1) = int8(rand(6, 1) * 255)
mat3 = [mat3,colon(0,36,200)']
mat3Size = size(mat3)

%% 3 Array: Char Array vs. String Array
% 3(a)
helloChar = 'hello '
worldChar = 'world'
helloString = "hello "
worldString = "world"
helloWorldChar1 = [helloChar,worldChar]
helloWorldString1 = [helloString,worldString]
helloWorldChar2 = strcat(helloChar, worldChar)
helloWorldString2 = strcat(helloString, worldString)
% 3(b)
helloWorldChar1Class = class(helloWorldChar1)
helloWorldChar2Class = class(helloWorldChar2)
helloWorldString1Class = class(helloWorldString1)
helloWorldString2Class = class(helloWorldString2)
helloWorldChar1Length = length(helloWorldChar1)
helloWorldChar2Length = length(helloWorldChar2)
helloWorldString1Length = length(helloWorldString1)
helloWorldString2Length = length(helloWorldString2)

%% 4 Application: Image Processing
% 4(a)
uwGray = imread('UW_gray.png');
uwGraySize = size(uwGray)
[V, D] = eig(double(uwGray));
maxEigenvalue = max(D, [], 'all')
% 4(b)
imshow(uwGray)
steamboatLeft = uwGray(1:650, 171:650);
steamboatRight = fliplr(steamboatLeft);
steamboat = [steamboatLeft,steamboatRight];
% 4(c)
uwName = uwGray(651:960, :);
uwGrayNew = [steamboat;uwName];
imshow(uwGrayNew)
imwrite(uwGrayNew, 'UW_gray_new.png')
uwGrayNewSize = size(uwGrayNew)
whos
