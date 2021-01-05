function arm = forward_kinematics(arm)

vbase = [0; 0 ; 0];
v1 = arm.L{1};
v2 = arm.L{2};
v3 = arm.L{3};

Tbase = transform_x(arm.q(1), vbase);
T1 = transform_z(arm.q(2), v1);
T2 = transform_z(arm.q(3), v2);
T3 = transform_z(0, v3);

transformations = {Tbase, T1 , T2, T3};
arm.tmap = transform_map(transformations);
arm.g = arm.tmap{end};

end

