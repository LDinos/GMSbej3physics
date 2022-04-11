/// @description
gem1 = noone
gem2 = noone

function gem_is_close(g1, g2) {
	var same_x = abs(g1.x - g2.x) == 0
	var same_y = abs(g1.y - g2.y) == 0
	var close_to_x = abs(g1.x - g2.x) <= 64
	var close_to_y = abs(g1.y - g2.y) <= 64
	return (close_to_x && same_y ) || (close_to_y && same_x)
}

function swap(g1, g2) {
	g1.SWAP_X_START = g1.x
	g1.SWAP_X_END = g2.x
	g1.SWAP_Y_START = g1.y
	g1.SWAP_Y_END = g2.y
	g1.swapping_gem = g2
	g2.SWAP_X_START = g2.x
	g2.SWAP_X_END = g1.x
	g2.SWAP_Y_START = g2.y
	g2.SWAP_Y_END = g1.y
	g2.swapping_gem = g1
	
	g1.swap_alpha = 0
	g2.swap_alpha = 0
	g1.am_swapping = true
	g2.am_swapping = true
	g1.alarm[0] = 1
	g2.alarm[0] = 1
	gem_coords_update(g2.i_index, g2.j_index, g1)
	gem_coords_update(g1.i_index, g1.j_index, g2)
	match_find()
}
