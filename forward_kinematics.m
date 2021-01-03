function [g,tmap] = forward_kinematics(Q, L)

vbase = [0; 0 ; 0];
disp("Number of elements in L = " + numel(L))
V = cell(1, numel(L) + 1);
disp("Number of elements in V = " + numel(V))
V{1} = vbase;
for i=1:numel(L)
    V{i+1} = L{i};
end



transformations = cell(1, numel(V));

for i=1:numel(V)
    if i < numel(V)
        
        rot_axis = find(Q{i});
        
        if isempty(rot_axis);
           q = 0; 
           
        else
           q = nonzeros(Q{i});
           
        end
        
        if rot_axis == 1 
           
            transformations{i} = transform_x(q, V{i});
            
        elseif rot_axis == 2
            transformations{i} = transform_y(q, V{i});
            
        else
            
            transformations{i} = transform_z(q, V{i});
         
            
        end
        
        
    else
        V{i}
        transformations{i} = transform_z(0, V{i});
    end
    
end

tmap = transform_map(transformations);
tmap{1}
tmap{2}
tmap{3}
tmap{4}
g = tmap{end};

end

