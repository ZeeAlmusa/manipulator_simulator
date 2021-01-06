clear, clc;

%% construct arm
arm = struct;

L1 = [1, 0, 0];
L2 = [1, 0, 0];
L3 = [1, 0, 0];
L4 = [1, 0, 0];
L = {L1, L2, L3, L4};

arm.q = [0, 0, 0, 0]';
arm.rot = {'x', 'z', 'z', 'z'};
arm.L = L;
arm.ax = create_axis(1);
arm.graphics = {};
arm = forward_kinematics(arm);

%% trajectory

th = 0:pi/50:6*pi;
t = linspace(1.5, 3, length(th));
y = t.*cos(th);
z = t.*sin(th);
x = ones(size(z))*1.5;
plot3(x,y,z, '--m')

angle = ones(1, length(th))*deg2rad(90);
trajectory = [x; y; z;  angle];
% trajectory = trajectory(:,1);
% 
% trajectory = [1.5;  0 ; 1.5 ; deg2rad(90)];

%% solve
solution = move(arm, trajectory);
