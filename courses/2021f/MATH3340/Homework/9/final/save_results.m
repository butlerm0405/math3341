close all; clear; clc;

diary('final_p1.txt')
final_p1
diary off

diary('final_p2.txt')
final_p2
diary off

diary('final_p3.txt')
final_p3
diary off

prefix = 'final_p';
suffix = {'1a', '1b', '2', '3'};
for i = 1:4
    name = [prefix suffix{i} '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end