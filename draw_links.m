function [link_lines] = draw_links(tmap, ax)
%Provides handles to lines for a link chain

%Input:
%tmap - the transformation for each respective link the world frame
%ax - axis to be drawn on
    colors = {[0,0,0] , 1/255*[71, 0, 163], 1/255*[128, 43, 240],  1/255*[240, 236, 43]};
       
    tmap = [{transform_z(0,[0;0;0])}, tmap];
    link_lines = cell(size(tmap));
    
    for i=1:numel(tmap)-1
         end_points = [tmap{i}(1:3,4)' ; tmap{i+1}(1:3,4)'];
        %link_lines{i} = line('x', end_points(:,1), 'y', end_points(:,2), 'z',end_points(:,3), 'Parent', ax, 'Linestyle', '-', 'Marker', 'o', 'Color', colors{i});
        [X,Y,Z]=cylinder2P(0.1, 20 , end_points(1,:), end_points(2,:));
% 
%         
%         [U,V,W] = sphere;
%         
%         U = U*0.1 + end_points(2,1);
%         V = V*0.1 + end_points(2,2);
%         W = W*0.1 + end_points(2,3);
%         
        link_lines{i} = surf(X,Y,Z, 'FaceColor', colors{i});
%         link_lines{2*i} = surf(U,V,W);
    end
      
end

