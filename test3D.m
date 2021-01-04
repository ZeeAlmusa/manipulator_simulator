clear, clc;
[ax, f] = create_axis(1);
button = 1;
q = [0, 0, 0]';
L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L = {L1, L2, L3};

desired_pos = [1 ,  3 , 0]';
[q, sol] = arm_solve(desired_pos, q, L);

function [q, sol] = arm_solve(desired_pos, q, L)

%initialization for the view
ax = create_axis(1);
path = [];
%draw_target(desired_pos);

% th = 0:pi/50:2*pi;
% y = 2*cos(th);
% z = 2*sin(th);
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

% t = -3:0.1:3;
% y = 1/15*16*(sin(t)).^3;
% z = 1/15*(15*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

th = 0:pi/50:6*pi;
t = linspace(1,3,length(th));
y = 2*cos(th);
z = 2*sin(th);
x = t;
plot3(x,y,z, '--r')

% x = 1;
% y = 1;
% z = 1;

[g, tmap] = forward_kinematics(q, L);
link_lines = draw_links(tmap, ax);

DESIRED = [x;y;z];

for n=1:size(DESIRED,2)
    desired_pos = DESIRED(:,n);
    [q, sol] = get_IK(q, L, desired_pos);
    for i=1:size(sol,2)
        nextpoint = sol(:,i);
        [q, link_lines] = move(q, L, nextpoint, ax, link_lines);
%         path_next = forward_kinematics(q,L);
%         path = [path path_next(1:3,4)];
%         plot3(path(1,:), path(2,:), path(3,:), 'b');
    end
end


end
