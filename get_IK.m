function [q, sol] = get_IK(q, L, desired_pos)

%calculate initial conditions
g = forward_kinematics(q, L);
J = numerical_jacobian(q, L);
current_pos = tform2vec(g);

%calculate trajectory - (currently linear)
n = 10;
t = linspace(0, 1, n);
%this is a nx3 matrix where each row is a point on the line path
traj =(1-t).*current_pos + t.*desired_pos;

%draw robot




%set learning rate
alpha = 0.1;
sol = [];


for i=1:size(traj, 2)
    
    %calculate error
    desired_pos = traj(:, i);
    error = (desired_pos-current_pos);
    
    %loop to get to converge to a point in the workspace
    while norm(error)>10^-2

        J = numerical_jacobian(q, L);
        %M = true_jacobian(q, L)

        g  = forward_kinematics(q, L);

        current_pos = tform2vec(g);

        error = (desired_pos-current_pos);
        %path = draw_trajectory(path,current_pos, ax);
        q  = IK_solver(q, L, desired_pos, J, alpha);
        %link_lines = update_drawing(link_lines,tmap, ax);



    end
    
    sol = [sol, q];
    %output = display_solution(q);

end

end

