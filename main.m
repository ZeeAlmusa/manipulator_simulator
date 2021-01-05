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
trajectory = [1, 1, 1];

move(arm, trajectory);