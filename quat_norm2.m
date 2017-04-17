function [norm2] = quat_norm2(quat)

    q = quat;
    norm2 = q * q';

end