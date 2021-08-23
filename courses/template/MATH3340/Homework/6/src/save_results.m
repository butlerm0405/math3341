close all; clear; clc;
hw6_p2
prefix = 'hw6_p2';
for i = 1:1
    name = [prefix num2str(i) '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end

hw6_p3
prefix = 'hw6_p3_';
for i = 1:2
    name = [prefix num2str(i) '.pdf'];
    fig = figure(i);
    set(fig, 'PaperPositionMode', 'auto');
    pos = get(fig, 'PaperPosition');
    set(fig, 'PaperSize', [pos(3) pos(4)]);
    print(fig, '-dpdf', name);
end
