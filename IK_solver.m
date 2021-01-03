function [q, grad] = IK_solver(Q, desired_pos, J, alpha)
%IK_SOLVER Summary of this function goes here
%   Detailed explanation goes here
 
 [g, tmap] = forward_kinematics(Q, L);
 current_pos = tform2vec(g);
 %current_pos = [current_pos;sum(q)];

 grad = pinv(J)*(desired_pos-current_pos);
 q = q + alpha*grad;
 
 
 
 
end
