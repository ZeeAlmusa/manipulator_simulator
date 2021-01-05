%% CIRCLE
% th = 0:pi/50:2*pi;
% y = 2*cos(th);
% z = 2*sin(th);
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

%% HEART 
% t = -3:0.1:3;
% y = 1/15*16*(sin(t)).^3;
% z = 1/15*(15*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

%% Spiral
% th = 0:pi/50:2*pi;
% t = linspace(1,3,length(th));
% y = 2*cos(th);
% z = 2*sin(th);
% x = t;
% plot3(x,y,z)

%% MESH

y = [-2:0.5:2];
z = [-2:0.5:2];
[Y,Z] = meshgrid(y,z);