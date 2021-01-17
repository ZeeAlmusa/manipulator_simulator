clear, clc;

%% construct arm
arm = struct;

L1 = [1, 0, 0];
L2 = [1, 0, 0];
L3 = [1, 0, 0];
L4 = [0, 0, 0];
L5 = [1, 0, 0];
L = {L1, L2, L3, L4, L5};

arm.q = [0,  0, pi/2, pi/2]';
arm.q = 1.0e+05 *[0;
    0;
   0;
   0;
    0];
arm.rot = {'x', 'z', 'z', 'z', 'y'};
arm.L = L;
arm.ax = create_axis(1);
arm.graphics = {};
arm = forward_kinematics(arm);
arm.contrainPose = true;

%% trajectory

th = linspace(0, pi, 100);
th2 = linspace(0, 0, 100);
t = linspace(1,3,length(th));
y = ones(1, length(th))*2;
z = ones(1, length(th))*0;
x = ones(1, length(th))*2;

%angle = ones(1, length(th))*2;
trajectory = [x; y; z ; th];



plot3(x,y,z, '--m');




%% solve

solution = move(arm, trajectory);

