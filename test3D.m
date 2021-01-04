[ax, f] = create_axis(1);
button = 1;
q = [0, 0, 0];
q = deg2rad(q);

L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [2, 0, 0];
L = {L1, L2, L3};
% while sum(button) <=3   % read ginputs until a mouse right-button occurs
%     [x,y, button] = ginput(1);
%     %theta = 90;
%     desired_pos = [rand(1,3)*3]'%, theta]';
%     q = arm_solve(desired_pos, q);
% end

desired_pos = [3.9, 0.2 , 0]';
q = arm_solve(desired_pos, q, L);

function q = arm_solve(desired_pos, q, L)
ax = create_axis(1);
path = [];

draw_target(desired_pos);

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
    
    
    
end

output = display_solution(q);





end




