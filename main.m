clear, clcc;

%% construct arm
arm = struct;

L1 = [1, 0, 0];
L2 = [1, 0, 0];
L3 = [1, 0, 0];
L4 = [1, 0, 0];

L = {L1, L2, L3, L4};

arm.q = [0,  0, 0,0]';

arm.rot = {'x', 'z', 'z', 'z'};
arm.L = L;
arm.ax = create_axis(1);
arm.graphics = {};
arm = forward_kinematics(arm);
arm.contrainPose = false;

%% trajectory

% pos = ones(3,100).*[2; 1 ; 2];
% 
% z_angle = [ones(1, length(pos)/2)*pi, linspace(pi, 0, length(pos)/2)];
% y_angle = [linspace(-pi, 0, length(pos)/2) , ones(1, length(pos)/2)*0 ];
% 
% trajectory = [pos ; z_angle; y_angle];
% 
% plot3(trajectory(1,:), trajectory(2,:), trajectory(3,:), '--b');

t = -3:0.1:3;
y = 1/15*16*(sin(t)).^3;
z = 1/15*(15*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
x = ones(size(z))*3;I
plot3(x,y,z, '--m')
trajectory = [x; y; z];


%% solve

solution = move(arm, trajectory);

