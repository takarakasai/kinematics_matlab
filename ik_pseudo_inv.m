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
        thr = 1.0e-6;
    end
            
    count = 0;
    E = 1;
    while E > thr && count < 1000
        
        % jacobian
        jac = jacobian(link, r_idx, offset);

        % differential TODO:using positions
        % 位置偏差を計算する
        cur_pos = positions(link, r_idx, offset);
        dpos = pos(1:3) - cur_pos(1:3)';
        
        % 姿勢偏差を計算する
        axisz = [0,0,1];
        a2o_rot = vecs2rot(axisz, offset);
        crot = link(r_idx).rot * a2o_rot;
        drot = rot * crot';

        % 位置偏差＋姿勢偏差
        err = [dpos, rot2rpy(drot)]';

        % 偏差に重み行列を反映させる
        gk = jac' * W * err;
    
        % Gradient descent method
        % E = 1/2*(err' * W * err);
        % % E = 1/2*E;
        % Hk = - (E)/(gk' * gk);
        % dq = - Hk * gk;
        
        % Solvability-Unconcerned Inverse Kinematics by theLevenberg–Marquardt Method の 式番号に対応
        % Levenberg-Marquardt method by squared-error norm w/ minute bias 
        E = err' * W * err;
        % 式(14),(15)より
        Wn  = E* eye(r_idx - 1) + eye(r_idx - 1) * 0.001;
        % Levenberg-Marquardt method by squared-error norm
        %Wn  = E* eye(r_idx - 1);
        % 式(12) より
        Hk  = jac' * W * jac + Wn;
        % 式(11) より.
        % (is equal to dq = inv(Hk) * gk)
        dq = Hk \ gk;
        %iHk = pinv(Hk);
        %dp = iHk * gk;
        
        % 角度を更新する
        qk  = jangles(link, r_idx)';
        qk1 = qk + dq;

        % 角度をロボットに反映させてIKを計算する
        link = set_jangles(link, qk1);
        link = fk(link);

        count = count + 1;
    end
    
    %disp(count);
    %dp_draw_links(link);
    %plot3(pos(1), pos(2), pos(3), 'o');
    %plot3(cur_pos(1), cur_pos(2), cur_pos(3), 'x');

end


