if (!instance_exists(obj_player)) exit;
    
var _spd = point_distance(0, 0, obj_player.move_x, obj_player.move_y) / obj_player.move_speed;

var _sinewave = sin(current_time/100);
var _offset_x = _sinewave * _spd * 10;

_sinewave = sin(current_time/50);
var _offset_y = _sinewave * _spd * 10;

offset_x = lerp(offset_x, _offset_x, 0.2);
offset_y = lerp(offset_y, _offset_y, 0.2);


// Mouse movement shift
var _shift_x = window_mouse_get_delta_x() * -3;
var _shift_y = window_mouse_get_delta_y() * -1;
shift_x = lerp(shift_x, _shift_x, 0.04);
shift_y = lerp(shift_y, _shift_y, 0.1);
offset_x += shift_x;
offset_y += shift_y;
