function [quat] = quat_mul(p,q)

    vec = cross(p(1:3),q(1:3)) + q(4)*p(1:3) + p(4)*q(1:3);
    nor = p(4)*q(4) - p(1:3)*q(1:3)';
    quat = [vec, nor];
    %quat = vec2quat(vec, nor);
    
end