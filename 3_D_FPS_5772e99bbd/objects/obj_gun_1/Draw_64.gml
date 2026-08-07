gpu_push_state();

gpu_set_fog(false, 0, 0, 0);

var _scale = 2.25;
draw_sprite_ext(sprite_index, image_index, global.res_w / 2, global.res_h - 160, _scale, _scale, image_angle, image_blend, image_alpha);

gpu_pop_state();

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var size = 10; // Length of crosshair lines

draw_set_color(c_red);

// Horizontal line
draw_line(mx - size, my, mx + size, my);

// Vertical line
draw_line(mx, my - size, mx, my + size);

// Reset color back to default
draw_set_color(c_white);