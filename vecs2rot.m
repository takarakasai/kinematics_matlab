function [rot] = vecs2rot(from_vec, to_vec)

    q = vecs2quat(from_vec, to_vec);
    rot = quat2rot(q);
    
end