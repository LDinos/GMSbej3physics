/// @description
image_speed = 0
image_xscale = 0.25
image_yscale = image_xscale
image_index = irandom(global.skins) //irandom(image_number-1)

kill_alpha_def = 0.04
am_swapping = false //am I being swapped at the moment?
swapping_back = false //If im currently being swapped back for being illegal
swapping_gem = noone //the other gem im swapping with
swap_alpha = 0
swap_chan = animcurve_get_channel(anim_swap, "cur_swap")
SWAP_X_START = x
SWAP_Y_START = y
SWAP_X_END = x
SWAP_Y_END = y
selected = false //If I am selected by the cursor
j_index = (x - obj_board.x) div 64
i_index = (y - obj_board.y) div 64
grav = 0.4 //gravity multiplier
acc = 0 //acceleration value
am_zombie = false //a zombie gem is a gem that has the only purpose to do the shrink animation (it's dying)
killed_by_match = true //if im dead because of a match, we need to do the shrink animation
am_stationary = false //Am I hitting the ground and not in the need to move anymore?
match_id = NO_MATCH_ID //All gems that share the same match_id will be killed altogether
yend = y //gem will keep falling until it reaches or surpasses this value

kill_alpha = 0 //Used for shrinking animation
kill_chan = animcurve_get_channel(anim_gemdeath, "cur_gemdeath")

function move() {
	j_index = (x - obj_board.x) div 64
	i_index = (y - obj_board.y) div 64
	acc += grav
	if (y + acc >= yend) {
		acc = 0
		y = yend
		global.board_gems[i_index][j_index] = id
		if (!am_stationary) match_execute()
		am_stationary = true
	} else am_stationary = false
	y+=acc
}

function death_shrink_animation() {
	if (kill_alpha <= 1) {
		image_xscale = 0.25*animcurve_channel_evaluate(kill_chan, kill_alpha)
		image_yscale = image_xscale
		kill_alpha += kill_alpha_def
	} else instance_destroy()
}
