/// @description
var click = mouse_check_button_pressed(mb_left)

if (click) {
	var g = instance_position(mouse_x, mouse_y, obj_gem)
	
	if (g != noone) {
		if (!g.am_swapping && !g.am_zombie) {
			if (gem1 == noone) {gem1 = g; gem1.selected = true}
			else {
				if (gem1 == g) {g.selected = false; gem1 = noone}
				else if gem_is_close(gem1, g) && gem1.am_stationary && g.am_stationary {
					//do swap here
					swap(gem1,g)
					gem1.selected = noone
					gem1 = noone
				}
				else {gem1.selected = false; gem1 = g; g.selected = true}
			}
		}
	} else {
		with(gem1) selected = false
		gem1 = noone
	}
}
