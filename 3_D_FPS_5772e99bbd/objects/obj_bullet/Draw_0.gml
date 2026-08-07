gpu_set_depth(obj_player.z - 8);

var _dist = point_distance(xprevious, yprevious, x, y);
var _dir  = point_direction(xprevious, yprevious, x, y);
var _spr_w = sprite_get_width(spr_knife_throw);

if (_dist > 0 && _spr_w > 0) {
    // Scale the sprite length to match the distance between positions
    var _xscale = _dist / _spr_w;
    draw_sprite_ext(spr_knife_throw, image_index, xprevious, yprevious, _xscale, 1, _dir, c_white, 1);
} else {
    draw_sprite(spr_knife_throw, image_index, x, y);
}

gpu_set_depth(0);
