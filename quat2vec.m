function [vec,ang] = quat2vec(quat)

    q = quat;
    ang = acos(q(4)) * 2;
    vec(1) = q(1) / sin(ang/2);
    vec(2) = q(2) / sin(ang/2);
    vec(3) = q(3) / sin(ang/2);

end