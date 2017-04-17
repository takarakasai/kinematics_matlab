function [quat] = rot2quat(rot)

    r = rot;
    t = [ 0,-2,-2, 0, 1;  %   x2   r11
         -2, 0,-2, 0, 1;  %   y2   r22
         -2,-2, 0, 0, 1;  % * z2 = r33
          1, 1, 1, 1, 0;  %   w2     1
          0, 0, 0, 0, 1;] %    1     1
     
    inv_t = inv(t);
    
    tmp = inv_t * [rot(1,1), rot(2,2), rot(3,3), 1, 1]';
    x2 = tmp(1);
    y2 = tmp(2);
    z2 = tmp(3);
    w2 = tmp(4);

    q1 = sqrt(x2); % q(1);
    q2 = sqrt(y2); % q(2);
    q3 = sqrt(z2); % q(3);
    q4 = sqrt(w2); % q(4);
    
    sign1 = sign(rot(3,2)-rot(2,3)); % x
    sign2 = sign(rot(3,1)-rot(1,3)); % y
    sign3 = sign(rot(2,1)-rot(1,2)); % z
    sign4 = 1;
    
    quat = [sign1*q1, sign2*q2, sign3*q3, sign4*q4];
    
    
    %rot = [
    %        1-2*y*y-2*z*z, 2*x*y+2*w*z, 2*x*z-2*w*y;
    %        2*x*y-2*w*z, 1-2*x*x-2*z*z, 2*y*z+2*w*x;
    %        2*x*z+2*w*y, 2*y*z-2*w*x, 1-2*x*x-2*y*y;
    %    ]';    
    
end