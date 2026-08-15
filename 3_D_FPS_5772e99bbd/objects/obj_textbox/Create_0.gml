// --- box position / size ---
box_x            = 5;
box_y            = 585;

portrait_w       = 150;
portrait_h       = 260;   // portrait box is a bit SHORTER
portrait_y_off   = -130;   // ...and sits a bit HIGHER than the text box

text_box_w       = 640;   // was 480 — wider box
text_h           = 150;   // was 130 — a bit taller to fit bigger text
slant            = 65;    // was 55 — scale the slant with the new width   // text box is TALLER
text_y_off       = 0;    // ...and sits a bit LOWER, extending past the portrait
					     // how far the right edge kicks outward at the bottom
gap              = 0;     // gap between portrait box and text box
border_thick     = 5;     // white border thickness (make this visible!)
wobble_amount    = 2;     // hand-drawn roughness

col_border       = c_white;
col_fill         = c_black;
col_text         = c_white;

portrait_sprite  = -1;
portrait_image   = 0;

full_text        = "";
displayed_text   = "";
char_index       = 0;
type_speed       = 1;
type_timer       = 0;
type_delay       = 1;
is_typing        = false;
is_open          = false;
text_pad_x       = 24;
text_pad_y       = 20;
text_line_sep    = 8;
depth = -10000; // very low depth = draws last = appears on top of everything

blip_sound       = -1;
blip_every       = 2;

portrait_pts_x   = array_create(4, 0);
portrait_pts_y   = array_create(4, 0);
text_pts_x       = array_create(4, 0);
text_pts_y       = array_create(4, 0);
text_queue       = [];   // array of strings waiting to be shown
queue_index      = 0;

randomize();
un_generate_box_shape();