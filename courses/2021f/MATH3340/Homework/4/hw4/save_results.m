clc; clear; close all;
diary('hw4_p2.txt')
hw4_p2
diary off

diary('hw4_p3.txt')
hw4_p3
diary off

diary('hw4_p4.txt')
hw4_p4
diary off

prefix = 'hw4_p';
for i = 3:4
    name = [prefix num2str(i) '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end
