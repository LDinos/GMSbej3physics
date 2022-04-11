/// @description SWAP ANIM
swap_alpha += 0.05
x = lerp(SWAP_X_START, SWAP_X_END, animcurve_channel_evaluate(swap_chan, swap_alpha))
y = lerp(SWAP_Y_START, SWAP_Y_END, animcurve_channel_evaluate(swap_chan, swap_alpha))
if (swap_alpha > 1) {
	x = SWAP_X_END
	y = SWAP_Y_END
	var other_gem_swapped = (instance_exists(swapping_gem))
	if (other_gem_swapped) other_gem_swapped = (swapping_gem.match_id != NO_MATCH_ID)
	if (!swapping_back) {
		if (match_id == NO_MATCH_ID) && !other_gem_swapped //no matches for any of us :(
		{
			swapping_back = true
			var temp = SWAP_X_START
			SWAP_X_START = SWAP_X_END
			SWAP_X_END = temp
			var temp = SWAP_Y_START
			SWAP_Y_START = SWAP_Y_END
			SWAP_Y_END = temp
			swap_alpha = 0
			var new_j = (SWAP_X_END - obj_board.x) div 64
			var new_i = (SWAP_Y_END - obj_board.y) div 64
			gem_coords_update(new_i, new_j, id)
			alarm[0] = 1
		} else am_swapping = false
	} else {
		am_swapping = false
		swapping_back = false
	}
}
else alarm[0] = 1
