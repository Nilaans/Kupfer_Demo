draw_set_font(Font1);
draw_set_valign(fa_bottom);

// --- HEALTH BAR SETUP ---
// Calculates what percent of hp the player has
dechp = hp / max_hp;

// Changes the colour of the hp bar
if (dechp >= 0.75)
{
	col = c_green;
}
else if (dechp >= 0.25)
{
	col = c_yellow;
}
else
{
	col = c_red;
}

// Drawing the background of the HP bar
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(0, 0); // Top Left
	draw_vertex(0, 72);
	
	draw_vertex(516, 0);
	draw_vertex(528, 72);
draw_primitive_end();


// --- MANA BAR SETUP ---
// Calculates what percent of mana the player has
decmana = mana / max_mana;

// Changes the colour of the mana bar
if (decmana >= 0.75)
{
	mana_col = c_blue;
}
else if (decmana >= 0.25)
{
	mana_col = c_aqua;
}
else
{
	mana_col = c_navy;
}

// Drawing the background of the Mana bar (shifted down to Y: 80 - 152)
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(0, 72); // Top Left
	draw_vertex(0, 122);
	
	draw_vertex(628, 72);
	draw_vertex(616, 122);
draw_primitive_end();


draw_rectangle(global.res_w - 100, global.res_h - 120, global.res_w, 120, false);
	
gpu_push_state();
gpu_set_fog(false, 0, 0, 0);

// --- DRAW HEALTH BAR FILL ---
draw_primitive_begin(pr_trianglestrip);
	draw_vertex_colour(10, 10, col, 1); // Top Left
	draw_vertex_colour(10, 60, col, 1); 
	
	draw_vertex_colour(506 * dechp, 10, col, 1);
	draw_vertex_colour(518 * dechp, 60, col, 1); 
draw_primitive_end();

// --- DRAW MANA BAR FILL ---
// Y coordinates offset to fit inside the mana background (Y: 90 - 140)
draw_primitive_begin(pr_trianglestrip);
	draw_vertex_colour(10, 82, mana_col, 1); // Top Left
	draw_vertex_colour(10,112, mana_col, 1); 
	
	draw_vertex_colour(618 * decmana, 82, mana_col, 1);
	draw_vertex_colour(606 * decmana, 112, mana_col, 1); 
draw_primitive_end();

// --- AMMO DRAWING ---
for (var i = 0; i < ammo_count; i++)
{
	var j = i + 1;
	ammo_h_bottom = global.res_h - 120;
	ammo_h_top = 120;
	ammo_recent_box = ammo_h_bottom - ((size * i) + (spacing * j));
	draw_rectangle_colour(global.res_w - 90, ammo_recent_box, global.res_w - 10, ammo_recent_box - size, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
}

gpu_pop_state();

draw_set_valign(fa_top);