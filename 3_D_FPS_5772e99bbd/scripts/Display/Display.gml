global.res_w = 1280;
global.res_h = 720;

window_set_size(global.res_w, global.res_h);
surface_resize(application_surface, global.res_w, global.res_h);


// Layers
layer_force_draw_depth(true, 0);

// Z sorting
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

// Draw 3D function
function draw_in_3d(_xoff, _yoff, _zoff, _xrot, _yrot, _zrot, _image_xscale, _image_yscale)
{
    var _matrix = matrix_build(x + _xoff, y + _yoff, _zoff, _xrot, _yrot, _zrot, 1, 1, 1);
    
    matrix_set(matrix_world, _matrix);
    
    draw_sprite_ext(sprite_index, image_index, 0, 0, _image_xscale, _image_yscale, image_angle, image_blend, image_alpha);
    
    matrix_set(matrix_world, matrix_build_identity());
}

function draw_billboard(_z_tilt = 1)
{
    if (!instance_exists(obj_player)) return;

    var _dir = obj_player.direction + 90;
    var _matrix = matrix_build(x, y, 0, 90 + obj_player.tilt * _z_tilt, 0, _dir, 1, 1, 1);

    matrix_set(matrix_world, _matrix);
    draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    matrix_set(matrix_world, matrix_build_identity());
}
function crossfade_room_music(_from, _to, _duration = 2000)
{
    if (!is_undefined(_from) && audio_exists(_from) && audio_is_playing(_from))
    {
        var _stop_handle = _from; // capture into a fresh local for the closure
        audio_sound_gain(_stop_handle, 0, _duration);
        call_later(_duration, time_source_units_frames, function() {
            if (audio_exists(_stop_handle)) {
                audio_stop_sound(_stop_handle);
            }
        }, false);
    }

    var _handle = audio_play_sound(_to, 1, true);
    audio_sound_gain(_handle, 0, 0);
    audio_sound_gain(_handle, 1, _duration);
    return _handle;
}
