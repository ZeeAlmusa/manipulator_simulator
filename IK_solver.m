function arm = IK_solver(arm, desired_pos, alpha)
%IK_SOLVER Summary of this function goes here
%   Detailed explanation goes here
 
 arm = forward_kinematics(arm);
 current_pos = tform2vec(arm.g);
 %current_pos = [current_pos;sum(q)];

 grad = pinv(arm.J)*(desired_pos-current_pos);
 arm.q = arm.q + alpha*grad;
 
 
 
 
end

