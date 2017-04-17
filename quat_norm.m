function [norm] = quat_norm(quat)

    q = quat;
    norm = sqrt(q * q');

end