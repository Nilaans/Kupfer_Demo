is_charged = false;
splash_damage = 3;
direct_damage = 1;
z_tilt = obj_3d.z_tilt;
alarm[0] = 60 * 5;

is_charged = false;
splash_damage = 3;
direct_damage = 1;
z_tilt = obj_3d.z_tilt;
alarm[0] = 60 * 5;

resolve_bullet_hit = function(_splash_damage, _direct_damage)
{
    if (is_charged)
    {
        // Spawn billboarded explosion object instead of standard 2D effect
        instance_create_depth(x, y, depth, obj_explosion_fx, {
            z_tilt: variable_instance_exists(id, "z_tilt") ? z_tilt : 1
        });

        // Area-of-Effect Damage
        var _explosion_radius = 64;
        with (obj_enemy_parent)
        {
            if (point_distance(x, y, other.x, other.y) <= _explosion_radius)
            {
                if (variable_instance_exists(id, "hit"))
                {
                    hit(_splash_damage);
                }
            }
        }
    }
    else
    {
        var _enemy = instance_place(x, y, obj_enemy_parent);
        if (_enemy != noone && variable_instance_exists(_enemy, "hit"))
        {
            _enemy.hit(_direct_damage);
        }
    }

    instance_destroy();
}