function J = numerical_jacobian(q, L)
%NUMERICAL_JACOBIAN Summary of this function goes here
%   Detailed explanation goes here

g = forward_kinematics(q, L);
fx = g(1,4);
fy = g(2,4);
fz = g(3,4);

dq = 0.001;
%perturb q1
h = q;
h(1) = h(1) + dq;
g1 = forward_kinematics(h, L);

fx1 = g1(1,4);
fy1 = g1(2,4);
fz1 = g1(3,4);
%perturb q2
h = q;
h(2) = h(2) + dq;
g2 = forward_kinematics(h, L);

fx2 = g2(1,4);
fy2 = g2(2,4);
fz2 = g2(3,4);

%perturb q3
h = q;
h(3) = h(3) + dq;
g3 = forward_kinematics(h, L);

fx3 = g3(1,4);
fy3 = g3(2,4);
fz3 = g3(3,4);

%forward euler jacobian
J = 1/dq * [fx1-fx, fx2-fx, fx3-fx;
            fy1-fy, fy2-fy, fy3-fy;
            fz1-fz, fz2-fz, fz3-fz];

end

