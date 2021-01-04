clear, clc;
[ax, f] = create_axis(1);
button = 1;
<<<<<<< HEAD
q = [0, 0, 0];
q = deg2rad(q);

=======
q = [0, 0, 0]';
>>>>>>> e9f6227f7dfc48c875143c10517e3f4e759aec77
L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [2, 0, 0];
L = {L1, L2, L3};

<<<<<<< HEAD
desired_pos = [3.9, 0.2 , 0]';
q = arm_solve(desired_pos, q, L);
=======
desired_pos = [3.9 ,  0.1 , 0]';
[q, sol] = arm_solve(desired_pos, q, L);
>>>>>>> e9f6227f7dfc48c875143c10517e3f4e759aec77

function [q, sol] = arm_solve(desired_pos, q, L)

%initialization for the view
ax = create_axis(1);
path = [];
draw_target(desired_pos);

<<<<<<< HEAD
[g, tmap] = forward_kinematics(q, L);


%J = numerical_jacobian(q, L)
J = true_jacobian(q, L);
link_lines = draw_links(tmap, ax);

current_pos = tform2vec(g);

alpha = 0.1;


error = (desired_pos-current_pos);

while norm(error)>10^-2
    
    %J = numerical_jacobian(q, L)
    J = true_jacobian(q, L);
    
    [g, tmap] = forward_kinematics(q, L);
    
    current_pos = tform2vec(g);
   
    error = (desired_pos-current_pos);
    path = draw_trajectory(path,current_pos, ax);
    [q, grad] = IK_solver(q, L, desired_pos, J, alpha);
    link_lines = update_drawing(link_lines,tmap, ax);
    
    
    
=======
[q, sol, link_lines] = get_IK(q, L, desired_pos, ax);

for i=1:size(sol,2)
    nextpoint = sol(:,i);
    [q, link_lines] = move(q, L, nextpoint, ax, link_lines);
>>>>>>> e9f6227f7dfc48c875143c10517e3f4e759aec77
end



end




