% Math 3341
% Lab 10

% Draw heart using plot and refresh frames using `drawnow`

clc; clear; close all; warning off;
a = 1:0.1:500;
x = linspace(-1.6, 1.6, 1000);
mov = VideoWriter('heart.mp4', 'MPEG-4');
open(mov)
fig = figure(1);
for i = 1:length(a)
    y = sqrt(cos(x)) .* cos(a(i) * x) + sqrt(abs(x)) - pi / 4 * (4 - x .^ 2).^(0.01);
    plot(x, y, 'r', 'LineWidth', 4);
    axis([-2, 2, -1.8, 1]);
    drawnow;
    M = getframe(fig);
    writeVideo(mov,M);
end
close(mov);
