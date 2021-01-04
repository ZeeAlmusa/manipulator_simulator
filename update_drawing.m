function link_lines = update_drawing(link_lines,tmap, ax)
%UPDATE_DRAWING Summary of this function goes here
%   Detailed explanation goes here
    pause(0.0001);
    
    for i=1:numel(link_lines)
        delete(link_lines{i});
    end
%     delete(link_lines{1});
%     delete(link_lines{2});
%     delete(link_lines{3});
%     delete(link_lines{4});
    link_lines = draw_links(tmap, ax);
end

