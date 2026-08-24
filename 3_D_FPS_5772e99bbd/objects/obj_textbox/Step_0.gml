if (is_open) {
    if (is_typing) {
        type_timer++;
        if (type_timer >= type_delay) {
            type_timer = 0;
            var _chars_to_add = type_speed;
            repeat (_chars_to_add) {
                if (char_index < string_length(full_text)) {
                    char_index++;
                    displayed_text = string_copy(full_text, 1, char_index);
                    // play a blip on non-space characters
                    var _c = string_char_at(full_text, char_index);
                    if (blip_sound != -1 && _c != " " && (char_index mod blip_every == 0)) {
                        audio_play_sound(blip_sound, 1, false);
                    }
                } else {
                    is_typing = false;
                    break;
                }
            }
        }
    }

    // press Z / Enter / left click to fast-forward, advance, or close the box
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left)) {
        if (is_typing) {
            // skip straight to full text
            displayed_text = full_text;
            char_index = string_length(full_text);
            is_typing = false;
        } else {
            // move to the next queued line, or close if none remain
            queue_index++;
            if (queue_index < array_length(text_queue)) {
                full_text      = text_queue[queue_index];
                displayed_text = "";
                char_index     = 0;
                type_timer     = 0;
                is_typing      = true;
            } else {
			    is_open = false;
			    if (!is_undefined(on_close)) {
			        var _cb = on_close;
			        on_close = undefined; // clear so it only fires once
			        _cb();
			    }
			}
        }
    }
}
