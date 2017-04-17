function [quatc] = quat_cond(quat)

    q = quat;
    quatc = [-q(1), -q(2), -q(3), q(4)];

end