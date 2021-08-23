clear; close all; clc;
format
diary('hw6_p1.txt');
hw6_p1
diary off;

hw6_p2
prefix = 'hw6_p2';
for i = 1:1
    name = [prefix '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end

hw6_p3
prefix = 'hw6_p3_';
for i = 1:4
    name = [prefix num2str(i) '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end

diary('hw6_p4.txt');
hw6_p4
diary off;

format