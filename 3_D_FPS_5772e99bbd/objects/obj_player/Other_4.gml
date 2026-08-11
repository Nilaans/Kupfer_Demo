// Set up camera
cam = camera_create_view(0, 0, global.res_w, global.res_h);
view_enabled = true;
view_visible[0] = true;
view_camera[0] = cam;
base_z = 224;

// Projection
proj_mat = matrix_build_projection_perspective_fov(80, -global.res_w/global.res_h, 3, 3000);
camera_set_proj_mat(cam, proj_mat);

//draw gun
gun = instance_create_depth(0, 0, 0, obj_gun_1);

//player numbers stuff
ammo_count += 25;

//tp player to spawn point
if(instance_find(obj_room_spawn_point, 0) >= 0)
{
	spawn_point = instance_find(obj_room_spawn_point, 0);
	x = spawn_point.x;
	y = spawn_point.y;
}