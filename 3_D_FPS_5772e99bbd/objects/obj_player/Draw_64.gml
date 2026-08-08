draw_set_font(Font1);
draw_set_valign(fa_bottom);

col = c_green;

dechp = hp/max_hp;

draw_primitive_begin(pr_trianglestrip);

	draw_vertex(0, 0); //Top Left
	draw_vertex(0, 72);
	
	draw_vertex(516, 0);
	draw_vertex(528, 72);
	
draw_primitive_end();
	
gpu_push_state();
gpu_set_fog(false, 0, 0, 0)

draw_text(20, global.res_h - 2, $"HP {hp}")
draw_text_transformed(1100, global.res_h - 500, $"AMMO {ammo_count}", 1, 1, -90)
draw_primitive_begin(pr_trianglestrip);

	draw_vertex_colour(10, 10, col, 255); //Top Left
	draw_vertex_colour(10, 60, col, 255); 
	
	draw_vertex_colour(506 * dechp, 10, col, 255);
	draw_vertex_colour(518 * dechp, 60, col, 255); 
	
	
draw_primitive_end();

gpu_pop_state();

draw_set_valign(fa_top);