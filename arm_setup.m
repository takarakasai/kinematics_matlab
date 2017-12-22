function [link] = arm_setup()

    % 本当は[TODO:]でも言及しているとおり、同一のリンクを親リンクとして持つような関節を
    % 扱うような仕組みがあった方が汎用性が高まるが、今回はわかりやすさを重視して
    % あえて同一の親リンクを持つリンクを辿るルーチンは入れていない.

    % TODO: -38.5?-28.5?-18.5?
    % TODO:        -7.5?-27.5?
    % link(1) としないのは繰り返し実行する際にエラーとなるのを防ぐため

    % TODO: -30.0 & -/+44.4
    ralink    = struct('name', 'base', 'offset', [ 0.0 0.0 0.00]', 'child', 2, 'dir', [0 0 0]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(2) = struct('name', '#1',   'offset', [ 0.0 0.0 0.20]', 'child', 3, 'dir', [0 0 1]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(3) = struct('name', '#2',   'offset', [ 0.0 0.0 0.20]', 'child', 4, 'dir', [0 1 0]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(4) = struct('name', '#3',   'offset', [ 0.0 0.0 0.20]', 'child', 5, 'dir', [0 0 1]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(5) = struct('name', '#4',   'offset', [ 0.0 0.0 0.20]', 'child', 6, 'dir', [0 1 0]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(6) = struct('name', '#5',   'offset', [ 0.0 0.0 0.20]', 'child', 7, 'dir', [0 1 0]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));
    ralink(7) = struct('name', '#6',   'offset', [ 0.0 0.0 0.20]', 'child', 0, 'dir', [0 0 1]', 'angle', 0, 'pos', [0,0,0], 'rot', eye(3));

    link = fk(ralink);

    