function path = draw_trajectory(path,current_pos, ax)
%DRAW_TRAJECTORY Summary of this function goes here
%   Detailed explanation goes here
path = [path current_pos];
plot(path(1,:), path(2,:), '--g');
end

