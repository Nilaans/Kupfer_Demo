//sprite_left = spr_enemy_1_walk_left;
//sprite_right = spr_enemy_1_walk_right;
sprite_down = spr_enemy_1_walk_down;
//sprite_up = spr_enemy_1_walk_up;

move_speed = 2;
//image_xscale = 0.375;
//image_yscale = 0.375;

//sprite_dead = spr_enemy_1_dead;

hp = 3;
is_hit = false;

hit = function (damage)
{
    hp -= damage;
    
	is_hit = true;
	
	alarm[0] = 15;
	
    if (hp <= 0)
    {
       // instance_create_depth(x, y, depth, obj_enemy_dead, {
       //    sprite_index : sprite_dead
       //})
        instance_destroy();
    }
}

flash_timer = 0;