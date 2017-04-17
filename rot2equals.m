function [equals] = rot2equals(rot)

    quat = rot2quat(rot);
    equals = quat2equals(quat);
    
end