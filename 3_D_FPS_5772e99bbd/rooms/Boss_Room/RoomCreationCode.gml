if (!audio_is_playing(H_08))
{
    audio_sound_gain(TPWKTA_04, 0, 2000);
    call_later(2000, time_source_units_frames, function() {
        audio_stop_sound(TPWKTA_04);
    }, false);
    room_audio = audio_play_sound(H_08, 1, true);
    audio_sound_gain(room_audio, 0, 0);
    audio_sound_gain(room_audio, 1, 2000);
}

with (obj_textbox) {
    un_textbox_start([
        "Howdy Partna'",
        "Haven't seen you in a while...",
        "Last time we met, you shot me at high noon...",
        "We didn't even get to 10 paces...",
        "...",
        "Big man uptop wants me to bring you in...",
        "And I'm happy to oblige...",
        "So be a good little knight and submit.",
    ], spr_Dyin_portrait, 0);

    on_close = function() {
        audio_sound_gain(H_08, 0, 2000);
        call_later(2000, time_source_units_frames, function() {
            audio_stop_sound(H_08);
        }, false);
        room_audio = audio_play_sound(P_09, 1, true);
        audio_sound_gain(room_audio, 0, 0);
        audio_sound_gain(room_audio, 1, 2000);
    };
}