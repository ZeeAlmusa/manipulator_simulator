clear, clc;


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

th = 0:pi/50:2*pi;
y = 2*cos(th);
z = 2*sin(th);
x = ones(size(z))*3;
plot3(x,y,z, '--m')

trajectory = [x;y;z];

move(arm, trajectory);