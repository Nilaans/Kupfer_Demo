if (!instance_exists(obj_player)) exit;

// Build 3D billboard matrix
var _dir = obj_player.direction + 90;
var _matrix = matrix_build(x, y, 0, 90 + obj_player.tilt * z_tilt, 0, _dir, 1, 1, 1);

matrix_set(matrix_world, _matrix);

// Enable light blue fog if flashing
if (flash_timer > 0)
{
    gpu_set_fog(true, c_aqua, 0, 0);
}

// Draw the billboarded sprite
draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Disable fog and reset world matrix
if (flash_timer > 0)
{
    gpu_set_fog(false, c_white, 0, 0);
}

matrix_set(matrix_world, matrix_build_identity());
