function [jac] = jacobian(link, r_idx, offset)

    % joint space DOF : r_idx
    
    jac = zeros(6, r_idx - 1);
    
    % control point
    cp = link(r_idx).pos + offset';

    i = 1;
    idx = 1;
    while idx <= r_idx - 1       
        parent = idx;
        idx = link(idx).child;
        %cidx = link(idx).child;
        
        % vector from actuational axis to control point
        aa2c  = cp - link(parent).pos;
        % actuational axis at world coords
        aa_wc = link(idx).rot * link(idx).dir;
        
        tmp = cross(aa_wc, aa2c);
        jac(:,i) = [tmp; aa_wc];

        i = i + 1;
    end

end



