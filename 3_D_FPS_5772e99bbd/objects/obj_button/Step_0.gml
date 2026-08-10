// Check if the mouse is over this button
if (position_meeting(mouse_x, mouse_y, id)) {
	x_scale = 4; // 15% larger on hover
	y_scale = 1.15; // 15% larger on hover
} else {
    x_scale = 3.5;  // Normal size
	y_scale = 1; // 15% larger on hover
}

// Smoothly interpolate current scale to target scale
image_xscale = lerp(image_xscale, x_scale, 0.2);
image_yscale = lerp(image_yscale, y_scale, 0.2);