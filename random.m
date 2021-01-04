ax = create_axis(1);
[X1, Y1, Z1] = cylinder(0.1);
[X2, Y2, Z2] = cylinder(0.1);
[X3, Y3, Z3] = cylinder(0.1);

Z1 = Z1 * 1;
Z2 = Z2 * 2;
Z3 = Z3 * 2;

orig = size(X1);

H1 =  [reshape(X1, 1, []); reshape(Y1, 1, []) ;reshape(Z1, 1, [])];
ONE = ones(1, size(H1,2));
H1 = [H1; ONE];
H1

T = transform_x(90, [0,0,0]);
H1 = T*H1;
X1 = reshape(H1(1,:), 2, 21);
Y1 = reshape(H1(2,:), 2, 21);
Z1 = reshape(H1(3,:), 2, 21);


link1 = surf(X1,Y1,Z1, 'FaceColor', 'r');
 


