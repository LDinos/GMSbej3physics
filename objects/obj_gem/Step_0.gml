/// @description
if (!am_zombie) {
	if (!am_swapping) move()
	else am_stationary = false
} else {
	death_shrink_animation()
}
