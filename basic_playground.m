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
% th = 0:pi/50:3*pi;
% t = linspace(1,3,length(th));
% y = 2*cos(th);
% z = 2*sin(th);
% x = t;
% plot3(x,y,z)

%% MESH

y = [-2:0.5:2];
z = [-2:0.5:2];
[Y,Z] = meshgrid(y,z);
X1 = ones(size(Y));
X2 = ones(size(Y))*1.5;

Y = reshape(Y,1, numel(Y));
Z = reshape(Z,1, numel(Z));
X1 = reshape(X1, 1, numel(X1));
X2 = reshape(X2, 1, numel(X2));

Y = [Y(:), Y(:)].';
Y = [Y(:)];

Z = [Z(:), Z(:)].';
Z = [Z(:)];

X = [X1(:), X2(:)].';
X = [X(:)];

plot3(X, Y, Z)
