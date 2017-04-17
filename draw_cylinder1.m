function [ output_args ] = untitled(pos, rot, dir, r, len, num_of_step)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dir = [0,0,1]';
cpos = pos + rot * (len / 2.0 * dir);
draw_cylinder(cpos, rot, dir, r, len, num_of_step, 'red')

end