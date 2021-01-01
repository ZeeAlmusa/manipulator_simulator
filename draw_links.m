function [link_lines] = draw_links(tmap, ax)
%Provides handles to lines for a link chain

%Input:
%tmap - the transformation for each respective link the world frame
%ax - axis to be drawn on
    colors = ['k', 'k', 'b', 'r'];

    tmap = [{transform_z(0,[0;0;0])}, tmap];
    link_lines = cell(size(tmap));
    
    for i=1:numel(tmap)-1
         end_points = [tmap{i}(1:2,4)' ; tmap{i+1}(1:2,4)'];
        link_lines{i} = line('x', end_points(:,1), 'y', end_points(:,2), 'Parent', ax, 'Linestyle', '-', 'Marker', 'o', 'Color', colors(i));
        
    end
      
end

