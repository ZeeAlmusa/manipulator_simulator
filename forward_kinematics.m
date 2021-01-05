function [g,tmap] = forward_kinematics(q, L)

vbase = [0; 0 ; 0];
v1 = L{1};
v2 = L{2};
v3 = L{3};

Tbase = transform_x(q(1), vbase);
T1 = transform_z(q(2), v1);
T2 = transform_z(q(3), v2);
T3 = transform_z(0, v3);

transformations = {Tbase, T1 , T2, T3};
tmap = transform_map(transformations);
g = tmap{end};

end

