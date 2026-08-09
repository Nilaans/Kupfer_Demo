draw_set_font(Font1);
draw_set_valign(fa_bottom);

//Calculates what percent of hp the player has
dechp = hp/max_hp;

//Changes the colour of the hp bar
if (dechp >=0.75)
{
	col = c_green;
}
else if (dechp >= 0.25)
{
	col = c_yellow
}
else
{
	col = c_red
}
 //Drawing the bottom of the HP bar
draw_primitive_begin(pr_trianglestrip);

	draw_vertex(0, 0); //Top Left
	draw_vertex(0, 72);
	
	draw_vertex(516, 0);
	draw_vertex(528, 72);
	
draw_primitive_end();



draw_rectangle(global.res_w - 100, global.res_h - 120, global.res_w, 120, false);
	
gpu_push_state();
gpu_set_fog(false, 0, 0, 0)

//draw_text(20, global.res_h - 2, $"HP {hp}")
//draw_text_transformed(1100, global.res_h - 500, $"AMMO {ammo_count}", 1, 1, -90)
draw_primitive_begin(pr_trianglestrip);

	draw_vertex_colour(10, 10, col, 255); //Top Left
	draw_vertex_colour(10, 60, col, 255); 
	
	draw_vertex_colour(506 * dechp, 10, col, 255);
	draw_vertex_colour(518 * dechp, 60, col, 255); 
	
	
draw_primitive_end();

for (var i = 0; i < ammo_count; i++)
{
	j = i + 1
	ammo_h_bottom = global.res_h - 120;
	ammo_h_top = 120;
	ammo_recent_box = ammo_h_bottom - ((size * i) + (spacing * j));
	draw_rectangle_colour(global.res_w - 90, ammo_recent_box, global.res_w - 10, ammo_recent_box - size, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false );
}

gpu_pop_state();

draw_set_valign(fa_top);