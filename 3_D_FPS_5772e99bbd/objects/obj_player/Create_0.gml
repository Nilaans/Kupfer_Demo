/*
// Set up camera
cam = camera_create_view(0, 0, global.res_w, global.res_h);
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;
base_z = 224;

// Projection
proj_mat = matrix_build_projection_perspective_fov(80, -global.res_w/global.res_h, 3, 3000);
camera_set_proj_mat(cam, proj_mat);
*/
// Look
view_mat = [];
z = 224;
direction = 90; // X look
tilt = 0; // Y look

// Mouselook
sens_x = 0.2;
sens_y = 0.2;

window_mouse_set_locked(true);

// Movement
move_speed = 4;
move_x = 0;
move_y = 0;
z_speed = 0;
auto_run = false;
dash_state = false;
dash_ready = true;

jump_speed = 12;      // Initial upward launch speed
gravity_force = 0.6;  // Constant downward acceleration
is_grounded = true;

// Weapon
//gun = instance_create_depth(0, 0, 0, obj_gun_1);
shoot_interval = 15;
shoot_time = 0;
ammo_count = 25;
spacing = 100 / ammo_count;
size = (480 - (100 + spacing))/ammo_count;

// Health
hp = 100;
max_hp = 100;
immune = false;

//Mana
mana = 150;
max_mana = 150;
camoflauged = false;

// Keybinds
forward_key = ord("W");
up_key = forward_key;
backward_key = ord("S");
down_key = backward_key;
right_key = ord("D");
left_key = ord("A");
jump_key = vk_space;
run_key = vk_shift;
main_attack_key = mb_left;
shoot_key = main_attack_key;
big_shot = main_attack_key;
dash_key = mb_right;