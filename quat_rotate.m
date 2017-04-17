function [v] = quat_rotate(q, vec)

    q = quat_mul(quat_mul(q, [vec, 0]), quat_cond(q));
    v = q(1:3);
    
end