clear, clc;

%% construct arm
arm = struct;

L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L = {L1, L2, L3};

arm.q = [0, 0, 0]';
arm.L = L;
arm.ax = create_axis(1);
arm.graphics = {};
arm = forward_kinematics(arm);

%% trajectory
% th = 0:pi/50:2*pi;
% y = 2*cos(th);
% z = 2*sin(th);
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

%trajectory = [x;y;z];

th = 0:pi/50:6*pi;
t = linspace(1,3,length(th));
y = 2*cos(th);
z = 2*sin(th);
x = t;
plot3(x,y,z, '--m')
trajectory = [x;y;z];

%trajectory = [1;2;1];

% y = [-1:0.5:1];
% z = [-1:0.5:1];
% [Y,Z] = meshgrid(y,z);
% X1 = ones(size(Y))*2.8;
% X2 = ones(size(Y))*3;
% 
% Y = reshape(Y,1, numel(Y));
% Z = reshape(Z,1, numel(Z));
% X1 = reshape(X1, 1, numel(X1));
% X2 = reshape(X2, 1, numel(X2));
% 
% Y = [Y(:), Y(:)].';
% Y = [Y(:)];
% 
% Z = [Z(:), Z(:)].';
% Z = [Z(:)];
% 
% X = [X1(:), X2(:)].';
% X = [X(:)];
% 
% plot3(X, Y, Z, '--m')
% 
% trajectory = [X';Y';Z'];


%% solve
solution = move(arm, trajectory);
