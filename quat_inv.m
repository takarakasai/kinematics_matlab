function [quati] = quat_inv(quat)

    q = quat;
    %quati = [-q(1), -q(2), -q(3), q(4)] / quat_norm2(q);
    quati = quat_cond(q) / quat_norm2(q);

end