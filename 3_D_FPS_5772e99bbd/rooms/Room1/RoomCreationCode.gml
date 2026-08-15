
room_audio = crossfade_room_music(MiN_02, TPWKTA_04);

// Fog
global.fog_colour = merge_color(c_black, c_blue, 0.1);
gpu_set_fog(true, global.fog_colour, 50, 500);