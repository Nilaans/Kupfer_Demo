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
                hit(3);
            }
        }
    }
}
else
{
    var _enemy = instance_place(x, y, obj_enemy_parent);
    if (_enemy != noone && variable_instance_exists(_enemy, "hit"))
    {
        _enemy.hit(1);
    }
}

instance_destroy();