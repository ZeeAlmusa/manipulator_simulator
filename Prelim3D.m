syms q1 q2 q3 L1 L2 

vbase = [0; 0 ; 0];
v1 = [L1; 0; 0];
v2 = [L2; 0; 0];



Tbase = transform_x(q1, vbase);
T1 = transform_z(q2, v1);
T2 = transform_z(q3, v2);

transformations = {Tbase, T1, T2};
tmap = transform_map(transformations);
g = simplify(tmap{end});

e1 = (vectorize_matrix(simplify(diff(g, q1)*inv(g))))
e2 = (vectorize_matrix(simplify(diff(g, q2)*inv(g))))
e3 = (vectorize_matrix(simplify(diff(g, q3)*inv(g))))

J = [e1, e2, e3]