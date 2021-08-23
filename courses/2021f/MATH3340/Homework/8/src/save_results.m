close all; clear; clc;

diary('hw8_p2.txt')
hw8_p2
diary off

diary('hw8_p3.txt')
hw8_p3
diary off

prefix = 'hw8_p3';
for i = 1:1
    name = [prefix '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end
