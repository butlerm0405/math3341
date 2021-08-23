clear; close all; clc;
hw5_p1

suffix = {'b', 'c'};
prefix = 'hw5_p1_';
for i = 1:2
    name = [prefix suffix{i} '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end

diary('hw5_p2.txt')
hw5_p2
diary off

diary('hw5_p3.txt')
hw5_p3
diary off
