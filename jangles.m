function [ang] = jangles(link, r_idx)

    % joint space DOF : r_idx
    
    i = 1;
    idx = 1;
    while idx <= r_idx - 1       
        parent = idx;
        idx = link(idx).child;
        %cidx = link(idx).child;
        
        ang(i) = link(idx).angle;

        i = i + 1;
    end
    
    ang = deg2rad(ang);

end



