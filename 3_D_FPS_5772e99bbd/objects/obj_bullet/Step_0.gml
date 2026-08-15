var _col = collision_line(xprevious, yprevious, x, y, obj_enemy_parent, false, false);
if (_col != noone)
{
    _col.hit(1);
    instance_destroy();
}
function resolve_bullet_hit(_splash_dmg, _direct_dmg, _radius = 64)
{
    if (is_charged)
    {
        instance_create_depth(x, y, depth, obj_explosion_fx, {
            z_tilt: variable_instance_exists(id, "z_tilt") ? z_tilt : 1
        });

        with (obj_enemy_parent)
        {
            if (point_distance(x, y, other.x, other.y) <= _radius && variable_instance_exists(id, "hit"))
                hit(_splash_dmg);
        }
    }
    else
    {
        var _enemy = instance_place(x, y, obj_enemy_parent);
        if (_enemy != noone && variable_instance_exists(_enemy, "hit"))
            _enemy.hit(_direct_dmg);
    }

    instance_destroy();
}