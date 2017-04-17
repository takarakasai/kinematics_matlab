function link = ik_pseudo_inv(link, r_idx, offset, pos, rot, thr, weight)

    if nargin < 7        
        W = eye(6);
        W(1,1) = 3;
        W(2,2) = 3;
        W(3,3) = 3;
        W(4,4) = 1;
        W(5,5) = 1;
        W(6,6) = 1;
    end
    if nargin < 6
        thr = 0.000001;
    end
            
    count = 0;
    Eq = 1;
    while Eq > thr && count < 1000
        
        % jacobian
        jac = jacobian(link, r_idx, offset);

        % differential TODO:using positions
        cur_pos = positions(link, r_idx, offset);
        dpos = pos(1:3) - cur_pos(1:3)';
        
        axisz = [0,0,1];
        a2o_rot = vecs2rot(axisz, offset);
        crot = link(r_idx).rot * a2o_rot;
        drot = rot * crot';

        err = [dpos, rot2rpy(drot)]';
    
        Eq = 1/2*(err' * W * err);
        gk = jac' * W * err;
        Hk = - (Eq)/(gk' * gk);
        dq = - Hk * gk;
        
        qk  = jangles(link, r_idx)';
        qk1 = qk + dq;

        link = set_jangles(link, qk1);
        link = fk(link);

        count = count + 1;
    end
    
    %disp(count);
    %dp_draw_links(link);
    %plot3(pos(1), pos(2), pos(3), 'o');
    %plot3(cur_pos(1), cur_pos(2), cur_pos(3), 'x');

end


