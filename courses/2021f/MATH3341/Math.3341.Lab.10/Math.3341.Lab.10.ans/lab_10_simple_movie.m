% Math 3341, Fall 2021
% Lab 10

% Demonstrates how to create a simple movie.
clear; close all;

L = 10;
x = linspace(-L,L,60);
y = x;
[X,Y] = meshgrid(x,y);

for j = 1:30
    u = tanh(sqrt(X.^2+Y.^2)).*cos((angle(X+i*Y)-(sqrt(X.^2+Y.^2)))+j);
    pcolor(X,Y,u)
    shading interp
    drawnow
    M(j) = getframe;
end

movie(M,4)
