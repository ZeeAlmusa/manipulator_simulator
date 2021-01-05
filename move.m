function [path_solution] = move(arm,trajectory, varargin)
%INPUTS

p = inputParser;

defaultInterpolation = 'linear';
validInterpolations = {'linear','quadratic','spline','quintic'};
checkInterpolation = @(x) any(validatestring(x,validInterpolations));

defaultInverseKineSolver = 'jacobian';
validSolvers = {'jacobian','CCD', 'FABRIK'};
checkSolvers = @(x) any(validatestring(x,validSolvers));

defaultShow = 'on';
validShow = {'on','off'};
checkShow = @(x) any(validatestring(x,validShow));
% 
addRequired(p,'arm');
addRequired(p,'trajectory');
addParameter(p,'interpolation',defaultInterpolation, checkInterpolation)
addParameter(p,'solver',defaultInverseKineSolver,checkSolvers)
addParameter(p,'view',defaultShow,checkShow)

%% Get Initial Conditions
ax = create_axis(1);
arm = forward_kinematics(arm);


arm.graphics = draw_links(arm.tmap, ax);

%% Calculate 

for n=1:size(trajectory,2)
    desired_pos = trajectory(:,n);
    [arm, sol] = get_IK(arm, desired_pos);
    
    for i=1:size(sol,2)
        nextpoint = sol(:,i);
        arm = step_move(arm, nextpoint);
%         path_next = forward_kinematics(q,L);
%         path = [path path_next(1:3,4)];
%         delete(current_path);
%         current_path = plot3(path(1,:), path(2,:), path(3,:), 'b');
    end
end
end

