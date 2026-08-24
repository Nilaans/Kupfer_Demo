/// @function un_generate_box_shape()
/// @description Builds the (slightly wobbly) outline points for both
///              the portrait box and the slanted text trapezoid.
function un_generate_box_shape() {
    var _w = wobble_amount;

    // ---- text trapezoid (lower + taller, slanted right edge) ----
    var ty0 = box_y + text_y_off;
    var ty1 = ty0 + text_h;
    var tx0 = box_x + portrait_w + gap;
    var tx1 = tx0 + text_box_w;
    var tx2 = tx0 + text_box_w + slant;
    var tx3 = tx0;

    text_pts_x[0] = tx0 + random_range(-_w, _w); text_pts_y[0] = ty0 + random_range(-_w, _w); // top-left
    text_pts_x[1] = tx1 + random_range(-_w, _w); text_pts_y[1] = ty0 + random_range(-_w, _w); // top-right
    text_pts_x[2] = tx2 + random_range(-_w, _w); text_pts_y[2] = ty1 + random_range(-_w, _w); // bottom-right (kicked out)
    text_pts_x[3] = tx3 + random_range(-_w, _w); text_pts_y[3] = ty1 + random_range(-_w, _w); // bottom-left

    // ---- portrait box (higher + shorter) ----
    var py0 = box_y + portrait_y_off;
    var py1 = py0 + portrait_h;
    var px0 = box_x;
    var px1 = box_x + portrait_w;
	var px2 = px0 + portrait_w + slant;
    var px3 = px0;

    portrait_pts_x[0] = px0 + random_range(-_w, _w); portrait_pts_y[0] = py0 + random_range(-_w, _w);
    portrait_pts_x[1] = px1 + random_range(-_w, _w); portrait_pts_y[1] = py0 + random_range(-_w, _w);
    portrait_pts_x[2] = px2 + random_range(-_w, _w); portrait_pts_y[2] = py1 + random_range(-_w, _w);
    portrait_pts_x[3] = px3 + random_range(-_w, _w); portrait_pts_y[3] = py1 + random_range(-_w, _w);


}


/// @function un_draw_quad_border(xs, ys, thickness, border_col, fill_col)
/// @description Draws a filled quad with a thick border by drawing an
///              outer colored quad, then a smaller inset quad on top.
function un_draw_quad_border(xs, ys, thickness, border_col, fill_col) {
    var _steps = 16;
    for (var i = 0; i < _steps; i++) {
        var _angle = (360 / _steps) * i;
        var _ox = lengthdir_x(thickness, _angle);
        var _oy = lengthdir_y(thickness, _angle);

        draw_primitive_begin(pr_trianglefan);
        draw_vertex_color(xs[0] + _ox, ys[0] + _oy, border_col, 1);
        draw_vertex_color(xs[1] + _ox, ys[1] + _oy, border_col, 1);
        draw_vertex_color(xs[2] + _ox, ys[2] + _oy, border_col, 1);
        draw_vertex_color(xs[3] + _ox, ys[3] + _oy, border_col, 1);
        draw_primitive_end();
    }

    // fill drawn on top, exactly at the original points
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_color(xs[0], ys[0], fill_col, 1);
    draw_vertex_color(xs[1], ys[1], fill_col, 1);
    draw_vertex_color(xs[2], ys[2], fill_col, 1);
    draw_vertex_color(xs[3], ys[3], fill_col, 1);
    draw_primitive_end();
}

/// @description Call this from anywhere (e.g. an NPC's interaction event)
///              to open the box and start the typewriter effect.
/// @function un_textbox_start(text_or_array, [portrait_spr], [portrait_img])
function un_textbox_start(_text, _portrait_spr, _portrait_img) {
    // accept either a single string or an array of strings
    if (is_array(_text)) {
        text_queue = _text;
    } else {
        text_queue = [_text];
    }

    queue_index     = 0;
    portrait_sprite = (argument_count > 1) ? _portrait_spr : -1;
    portrait_image  = (argument_count > 2) ? _portrait_img : 0;

    full_text      = text_queue[queue_index];
    displayed_text = "";
    char_index     = 0;
    type_timer     = 0;
    is_typing      = true;
    is_open        = true;
    un_generate_box_shape();
	
}