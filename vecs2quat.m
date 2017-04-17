function [q] = vecs2quat(from_vec, to_vec)

    axis = cross(from_vec, to_vec);
    if norm(axis) == 0
        % TODO: q = [0,0,0,0] ? 
        axis = [0,0,1];
        rad = 0.0;
    else
        n = from_vec * to_vec';
        rad = acos((n)/(norm(from_vec) * norm(to_vec)));
    end
    q = vec2quat(axis, rad);
   
end