clc; clear; close all;
diary('hw3_p1.txt')
hw3_p1
diary off

diary('hw3_p2.txt')
hw3_p2
diary off

diary('hw3_p3.txt')
hw3_p3
diary off

prefix = 'hw3_p';
for i = 1:3
    name = [prefix num2str(i) '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end