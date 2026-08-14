
if (!audio_is_playing(TPWKTA_04))
{
audio_sound_gain(MiN_02, 0, 2000);
call_later(2000, time_source_units_frames, function() {
    audio_stop_sound(MiN_02);
}, false);
room_audio = audio_play_sound(TPWKTA_04, 1, true);
audio_sound_gain(room_audio, 0, 0);
audio_sound_gain(room_audio, 1, 2000);

}
// Fog
global.fog_colour = merge_color(c_black, c_blue, 0.1);
gpu_set_fog(true, global.fog_colour, 50, 500);