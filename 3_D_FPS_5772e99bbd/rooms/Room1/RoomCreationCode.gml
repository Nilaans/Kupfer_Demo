audio_play_sound(TPWKTA_04,0, true);

// Fog
global.fog_colour = merge_color(c_black, c_blue, 0.1);
gpu_set_fog(true, global.fog_colour, 50, 500);