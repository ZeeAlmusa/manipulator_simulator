function [q, link_lines] = move(q, L, nextpoint, ax, link_lines)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
q = nextpoint;
[g, tmap] = forward_kinematics(q, L);
J = numerical_jacobian(q, L);
current_pos = tform2vec(g);


[g, tmap] = forward_kinematics(nextpoint, L);
link_lines = update_drawing(link_lines,tmap, ax);


end

