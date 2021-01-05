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

[arm.g, arm.tmap] = forward_kinematics(arm)

end

