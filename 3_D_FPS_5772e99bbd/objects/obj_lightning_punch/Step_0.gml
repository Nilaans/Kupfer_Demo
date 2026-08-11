var _hit_count = instance_place_list(x, y, obj_enemy_parent, hit_list, false);

// Check for collision along the movement path
var _col = collision_line(xprevious, yprevious, x, y, obj_enemy_parent, false, false);

if (_col != noone)
{
    // Call the hit method on the enemy
    if (variable_instance_exists(_col, "hit"))
    {
        _col.hit(damage);
    }
    
    instance_destroy();
}