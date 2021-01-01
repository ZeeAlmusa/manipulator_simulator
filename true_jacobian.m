function j = true_jacobian(q, l)
%JACOBIAN Summary of this function goes here
%   Detailed explanation goes here

q  = deg2rad(q);

q1 = q(1);
q2 = q(2);
q3 = q(3);

L1 = l(1);
L2 = l(2);
L3 = l(3);
% 
% j = [-l1*sin(q1)-l2*sin(q1+q2), -l2*sin(q1+q2);
%     l1*cos(q1)+l2*cos(q1+q2), l2*cos(q1+q2)];

j = [-L1*sin(q1)-L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L3*sin(q1+q2+q3);
     L1*cos(q1)+L2*cos(q1+q2)+L3*cos(q1+q2+q3), L2*cos(q1+q2)+L3*cos(q1+q2+q3), L3*cos(q1+q2+q3)]; 
    % 1,                                          1,                               1             ];
    
%%3D Jacobian of lab model

j = [ 0,           0,                 L2*sin(q2) ;
 0, -L1*cos(q1), -cos(q1)*(L1 + L2*cos(q2)) ;
 0, -L1*sin(q1), -sin(q1)*(L1 + L2*cos(q2)) ;
 0,     cos(q1),                    cos(q1) ;
 0,    -sin(q1),                   -sin(q1) ;
 1,           0,                          0]
end

