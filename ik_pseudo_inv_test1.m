%%

link = arm_setup();

%%

link_idx = size(link, 2)
offset = [0,0,-0.1];
dpos = [0.4, 0.0, 0.1];

default = [0,0,1];
z = -1.0;
r = 1.0;

for i = [1:0.1:6*pi]
    x = r*cos(i);
    y = r*sin(i);
    vec = [x,y,z];
    drot = vecs2rot(default, vec);
    drpy = rot2rpy(drot);
    drot = rpy2rot([drpy(1),drpy(2),-pi]);
    disp(rot2rpy(drot))

    link = ik_pseudo_inv(link, link_idx, offset, dpos, drot);
    dp_draw_links(link, [1,1,1]);

    plot3(dpos(1), dpos(2), dpos(3), 'o');
    cur_pos = positions(link, link_idx, offset);
    plot3(cur_pos(1), cur_pos(2), cur_pos(3), 'x');

    pause(0.03);
end

%%