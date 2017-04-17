function [ rpy ] = rot2rpy(rot)

    r = atan2(rot(3,2),rot(3,3));
    p = asin(-rot(3,1));
    y = atan2(rot(2,1),rot(1,1));
    rpy = [r,p,y];
       
end

