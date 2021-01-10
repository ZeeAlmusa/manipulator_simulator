clear, clc;

%% construct arm
arm = struct;

L1 = [1, 0, 0];
L2 = [1.2, 0, 0];
L3 = [1.2, 0, 0];
L4 = [1, 0, 0];
L = {L1, L2, L3, L4};

arm.q = [0, 0, 0, 0]';
arm.rot = {'x', 'z', 'z', 'z'};
arm.L = L;
arm.ax = create_axis(1);
arm.graphics = {};
arm = forward_kinematics(arm);
arm.contrainPose = true;

%% trajectory
% 
th = 0:pi/50:2*pi;
t = linspace(1,3,length(th));
y = 2*cos(th);
z = 2*sin(th);
x = 0.5*sin(12*th) + 2;

angle = ones(1, length(th))*deg2rad(90);
trajectory = [x; y; z ;  angle];

plot3(x,y,z, '--m');




%% solve

solution = move(arm, trajectory);

