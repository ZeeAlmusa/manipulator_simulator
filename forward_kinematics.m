function [g,tmap] = forward_kinematics(q)


vbase = [0; 0 ; 0];
v1 = [2; 0; 0];
v2 = [2; 0; 0];
v3 = [1; 0; 0];

Tbase = transform_z(q(1), vbase);
T1 = transform_z(q(2), v1);
T2 = transform_z(q(3), v2);
T3 = transform_z(0, v3);

transformations = {Tbase, T1, T2, T3};
tmap = transform_map(transformations);
g = tmap{end};

end

