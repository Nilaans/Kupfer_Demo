// Exit on Escape
if (keyboard_check(vk_escape))
{
    game_end();
}

var _mx = window_mouse_get_delta_x();
var _my = window_mouse_get_delta_y();

direction -= _mx * sens_x;
//tilt += _my * sens_y;
tilt = clamp(tilt, -80, 80);

// Movement
var _hor = real(keyboard_check(right_key)) - real(keyboard_check(left_key));
var _ver = real(keyboard_check(forward_key)) - real(keyboard_check(backward_key));

// Jump
if (keyboard_check_pressed(jump_key) && is_grounded)
{
    z_speed = jump_speed;
    is_grounded = false;
}

// Check adjacent wall collision (1 pixel check in 4 directions)
var _is_next_to_wall = place_meeting(x + 1, y, [obj_wall, obj_3d]) || 
                       place_meeting(x - 1, y, [obj_wall, obj_3d]) || 
                       place_meeting(x, y + 1, [obj_wall, obj_3d]) || 
                       place_meeting(x, y - 1, [obj_wall, obj_3d]);

var _is_wall_sticking = !is_grounded && keyboard_check(jump_key) && _is_next_to_wall;

// 2. Apply Physics
if (!is_grounded)
{
    if (_is_wall_sticking)
    {
        // Lock vertical momentum and position while clinging to the wall
        z_speed = 0;
    }
    else
    {
        // Update height by current speed
        z += z_speed;
        
        // Pull down by gravity
        z_speed -= gravity_force;
    }

    // Check Ground Collision
    if (z <= base_z)
    {
        z = base_z;
        z_speed = 0;
        is_grounded = true;
    }
}

//auto run stuff
if(keyboard_check_pressed(vk_control))
{
	auto_run = !auto_run;
}
if ((keyboard_check(run_key) && auto_run == false) || (!keyboard_check(run_key) && auto_run == true))
{
    _hor *= 2;
    _ver *= 2;
}

var _forward_dir = direction;
var _side_dir = direction-90;

var _move_x = lengthdir_x(_ver * move_speed, _forward_dir) + lengthdir_x(_hor * move_speed, _side_dir);
var _move_y = lengthdir_y(_ver * move_speed, _forward_dir) + lengthdir_y(_hor * move_speed, _side_dir);

if (abs(_move_x) < abs(move_x)) move_x *= 0.9;
    else move_x = _move_x;
if (abs(_move_y) < abs(move_y)) move_y *= 0.9;
    else move_y = _move_y;


move_and_collide(move_x, move_y, [obj_wall, obj_3d]);

//Dash
if(mouse_check_button_pressed(dash_key) && !dash_state && dash_ready)
{
	dash_state = true;
	alarm[1] = 10;
}
if(dash_state)
{
	if(_hor != 0 || _ver != 0)
	{
		move_and_collide((lengthdir_x(_ver * move_speed, _forward_dir) + lengthdir_x(_hor * move_speed, _side_dir))*10, (lengthdir_y(_ver * move_speed, _forward_dir) + lengthdir_y(_hor * move_speed, _side_dir))*10, [obj_wall, obj_obstacle_1]);
	}
	else
	{
		move_and_collide(lengthdir_x(move_speed, _forward_dir)*10, lengthdir_y(move_speed, _forward_dir)*10, [obj_wall, obj_obstacle_1]);
	}
}

// Shoot
// Cooldown tick
if (shoot_time > 0) shoot_time--;

// 1. Accumulate charge while holding button
if (mouse_check_button(main_attack_key) && shoot_time <= 0 && ammo_count > 0)
{
    // Only charge if player has at least 35 mana
    if (mana >= 35)
    {
        charge_time++;
    }
}

// 2. Fire on button release
if (mouse_check_button_released(main_attack_key) && shoot_time <= 0 && ammo_count > 0)
{
    var _is_fully_charged = (charge_time >= charge_max && mana >= 35);

    if (_is_fully_charged)
    {
        mana -= 35; // Deduct 35 mana for charged attack
    }

    gun.shoot();
    ammo_count--;
    shoot_time = shoot_interval;

    // Create the bullet
    instance_create_depth(x, y, depth, obj_bullet, {
        speed: _is_fully_charged ? 25 : 20,
        direction: direction,
        is_charged: _is_fully_charged,
        image_blend: _is_fully_charged ? c_aqua : c_white
    });

    charge_time = 0; // Reset charge
}

// Reset charge if button released prematurely
if (!mouse_check_button(main_attack_key))
{
    charge_time = 0;
}

//Camoflauge
if (keyboard_check_pressed(ord("C")) && mana >= 10)
{
	camoflauged = true;
	alarm[0] = 120;
	mana -= 10;
}

// Lightning Punch Attack
if (keyboard_check_pressed(ord("F")))
{
    show_debug_message("F key pressed. Current mana: " + string(mana));
    
    if (mana >= 20)
    {
        mana -= 20;
        show_debug_message("Spawning lightning punch!");
        
        instance_create_depth(x, y, depth, obj_lightning_punch, {
            speed: 30,
            direction: direction,
            z: z
        });
    }
}

// Mana Recharge
if (obj_enemy_parent.is_hit)
{
	chance = irandom_range(0,10);
	if (chance >= 6 && mana <= max_mana - 5)
	{
		mana += 5;
	}
	else if (chance >= 6 && mana > max_mana - 5)
	{
		mana = max_mana;
	}
}

// Debugging tools 
if (keyboard_check_pressed(vk_f1))
{
	hp = max_hp;
	mana = max_mana;
	ammo_count += 25;

}
if (keyboard_check_pressed(vk_f3))
{
	room_goto_next();
}
if (keyboard_check_pressed(vk_f2))
{
	room_goto_previous();
}
if (keyboard_check_pressed(ord("T")))
{
    show_debug_message("T key detected!");
    var _fx = instance_create_depth(x, y, -100 , obj_explosion_fx);
    show_debug_message("Spawned FX Instance ID: " + string(_fx));
}