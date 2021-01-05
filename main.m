clear, clc;
[ax, f] = create_axis(1);

arm = struct;

L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L = {L1, L2, L3};

arm.q = [0, 0, 0]';
arm.L = L;
arm.graphics = {};

move(arm, trajectory);