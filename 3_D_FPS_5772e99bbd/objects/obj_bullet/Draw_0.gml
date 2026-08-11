gpu_set_depth(obj_player.z - 8);

var _dist = point_distance(xprevious, yprevious, x, y);
var _dir  = point_direction(xprevious, yprevious, x, y);
var _spr_w = sprite_get_width(spr_knife_throw);

if (is_charged)
{
	image_colour = c_aqua;
}
else
{
	image_colour = c_white
}

if (_dist > 0 && _spr_w > 0) {
    // Scale the sprite length to match the distance between positions
    var _xscale = _dist / _spr_w;
    draw_sprite_ext(spr_knife_throw, image_index, xprevious, yprevious, _xscale, 1, _dir, image_colour, 1);
} else {
    draw_sprite(spr_knife_throw, image_index, x, y);
}

if (!instance_exists(obj_player)) exit;

// Match camera angle so bullet sprite faces player
var _dir = obj_player.direction + 90;
var _matrix = matrix_build(x, y, 0, 90 + obj_player.tilt, 0, _dir, 1, 1, 1);

matrix_set(matrix_world, _matrix);

// Draw the bullet sprite with its assigned blend color (c_aqua if charged)
draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

matrix_set(matrix_world, matrix_build_identity());

gpu_set_depth(0);
