clear, clc;
[ax, f] = create_axis(1);
button = 1;
q = [0, 0, 0]';
L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L = {L1, L2, L3};

desired_pos = [3.9 ,  0.1 , 0]';
[q, sol] = arm_solve(desired_pos, q, L);

function [q, sol] = arm_solve(desired_pos, q, L)

%initialization for the view
ax = create_axis(1);
path = [];
draw_target(desired_pos);

[q, sol, link_lines] = get_IK(q, L, desired_pos, ax);

for i=1:size(sol,2)
    nextpoint = sol(:,i);
    [q, link_lines] = move(q, L, nextpoint, ax, link_lines);
end



end




