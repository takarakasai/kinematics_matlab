function [quat] = vec2quat(vec,theta)

    v = vec / norm(vec);
    s = sin(theta/2);
    quat = [v(1)*s, v(2)*s, v(3)*s, cos(theta/2)];
    
end