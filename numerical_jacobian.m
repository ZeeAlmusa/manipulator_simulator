function arm = numerical_jacobian(arm)
%NUMERICAL_JACOBIAN Summary of this function goes here
%   Detailed explanation goes here

q = arm.q;

fx = arm.g(1,4);
fy = arm.g(2,4);
fz = arm.g(3,4);

dq = 0.001;
%perturb q1

arm.q(1) = arm.q(1) + dq;
arm1 = forward_kinematics(arm);

fx1 = arm1.g(1,4);
fy1 = arm1.g(2,4);
fz1 = arm1.g(3,4);
%perturb q2
arm.q = q;
arm.q(2) = arm.q(2) + dq;
arm2 = forward_kinematics(arm);

fx2 = arm2.g(1,4);
fy2 = arm2.g(2,4);
fz2 = arm2.g(3,4);

%perturb q3
arm.q = q;
arm.q(3) = arm.q(3) + dq;
arm3 = forward_kinematics(arm);

fx3 = arm3.g(1,4);
fy3 = arm3.g(2,4);
fz3 = arm3.g(3,4);

arm.q = q;
%forward euler jacobian
arm.J = 1/dq * [fx1-fx, fx2-fx, fx3-fx;
            fy1-fy, fy2-fy, fy3-fy;
            fz1-fz, fz2-fz, fz3-fz];

end

