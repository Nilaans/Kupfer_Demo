if (is_open) {
    // --- portrait box ---
    un_draw_quad_border(portrait_pts_x, portrait_pts_y, border_thick, col_border, col_fill);

    if (portrait_sprite != -1) {
        var _px = box_x + portrait_w / 2;
        var _py = box_y + portrait_y_off + portrait_h / 2;
        draw_sprite_ext(portrait_sprite, portrait_image, _px, _py, 1, 1, 0, c_white, 1);
    }

    // --- text trapezoid ---
    un_draw_quad_border(text_pts_x, text_pts_y, border_thick, col_border, col_fill);

    // --- text ---
    draw_set_color(col_text);
    draw_set_font(-1); // swap -1 for your Undertale-style font asset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var _text_x = box_x + portrait_w + gap + text_pad_x;
    var _text_y = box_y + text_y_off + text_pad_y;
    var _wrap_w = text_box_w - text_pad_x * 2;

    draw_text_ext(_text_x, _text_y, displayed_text, text_line_sep, _wrap_w);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}