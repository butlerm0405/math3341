% Math 3341
% Lab 10

% Demonstrates two ways to create an animated line.

clear; close all;

%% uses comet to animate plotting of a line
figure;
u = linspace(-2,2,500);
v = exp(u).*sin(1./u);
comet(u,v)

%% another way to create an animated line
figure;
x = linspace(-pi,pi,2000);
y = cos(tan(x)) - tan(sin(x));
h = animatedline('Marker', '.','Color','b','MarkerSize',5); % creates an animated line option

axis ([min(x) max(x) min(y) max(y)])

for k = 1:length(x)
    addpoints(h,x(k),y(k)) % adds points to animated line
    drawnow % updates figure onscreen after addpoints called
end
