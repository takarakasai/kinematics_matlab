%%

link = arm_setup();

%%

link_idx = 9;
offset = [0,0,-0.1];
dpos = [0.6, 0.0, 0.3];
%drot = rpy2rot([0,deg2rad(135),0]);
%ddrot = rpy2rot([0,deg2rad(3),0]);
p = [135:3:225,225:-3:135];
r = [  0:3:45 , 45:-3:-45, -45:3:0];

for i = [1:size(p, 2)]
    drot = rpy2rot([deg2rad(r(i)), deg2rad(p(i)), 0]);
    %drot = ddrot*drot;
    disp(i)

    link = ik_pseudo_inv(link, link_idx, offset, dpos, drot, 0.0000000001);
    dp_draw_links(link, [1,1,1]);

    plot3(dpos(1), dpos(2), dpos(3), 'o');
    cur_pos = positions(link, link_idx, offset);
    plot3(cur_pos(1), cur_pos(2), cur_pos(3), 'x');

    pause(0.03);
end

%%