function [v] = vec_rotate(vec, axis, rad)

    q = vec2quat(axis, rad);
    q2 = quat_rotate(q, vec);
    v = q2(1:3);

end