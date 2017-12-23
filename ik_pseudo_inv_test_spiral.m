%%

link = arm_setup();

%%

link_idx = size(link, 2)
offset = [0,0,0];
dpos_ = [0.40, 0.0, 0.01];

default = [0,0,1];
z = 0.0;
r = 0.1;

format long
bef = cputime;
idxs = [1:pi/30:6*pi];
traj = [0,0,0];
for i = idxs
    x = r*cos(i);
    y = r*sin(i);
    z = z + 0.001;
    %vec = [x,y,z];
    %drot = vecs2rot(default, vec);
    %drpy = rot2rpy(drot);
    %drot = rpy2rot([drpy(1),drpy(2),-pi]);
    %disp(rot2rpy(drot))
    dpos = [x+dpos_(1) y+dpos_(2) z+dpos_(3)];
    drot = dp_get_rpy_rot([180,0,0]);
    
    % IK
    link = ik_pseudo_inv(link, link_idx, offset, dpos, drot);
    
    % アームを表示
    dp_draw_links(link, [1,1,1]);

    % 目標位置と現在位置をプロット
    % IKが解けていれば近い点にプロットされる
    plot3(dpos(1), dpos(2), dpos(3), 'o');
    cur_pos = positions(link, link_idx, offset);
    plot3(cur_pos(1), cur_pos(2), cur_pos(3), 'x');
    traj = [traj; [cur_pos(1), cur_pos(2), cur_pos(3)]];
    plot3(traj(:,1), traj(:,2), traj(:,3), 'x');

    pause(0.01);
end
disp((cputime - bef) / size(idxs, 2) * 1000)

%%