function [ output_args ] = untitled(pos, rot, dir, r, len, num_of_step)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r_rate = 0.0003;
l_rate = 0.0007;
cyl_len = len * l_rate;
cone_len = len * (1 - l_rate);
draw_cylinder1(pos, rot, dir, r * r_rate, cyl_len, num_of_step);
%draw_cone(pos + cyl_len * dir, rot, dir, r, cone_len, num_of_step);
draw_cone(pos + rot * [0,0,cyl_len]', rot, dir, r, cone_len, num_of_step);

end