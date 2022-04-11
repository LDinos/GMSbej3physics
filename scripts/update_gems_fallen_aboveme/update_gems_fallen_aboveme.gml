/// @function update_gems_fallen_aboveme(i_index, j_index)
/// @description Similar to update_gems_fallen, this is used for when a match has been fully executed
/// @param {integer} i_index Row index
/// @param {integer} j_index Column index
function update_gems_fallen_aboveme(i_index, j_index){
	var _start = 7
	var temp_array = []
	for(var i = _start; i >= 0; i--) {
		temp_array[i] = global.board_gems_fallen[i][j_index] //transfer arrays
		global.board_gems_fallen[i][j_index] = noone //and make the real one empty
	}
	var k = _start
	for(var i = _start; i >= 0; i--) { //simulate gems falling down from here on and see where they fall
		var g = temp_array[i]
		if (g != noone) {
			if (g.am_zombie) { gem_coords_update(i, j_index, g); k = i} //if gem is zombie, it stays where it is
			else gem_coords_update(k, j_index, g)
			k--
		}
	}
	repeat(k+1) { //Now spawn gems in the rows where gems were killed
		var xx = obj_board.x + 32 + 64*j_index
		var yy = obj_board.y - 64 - 32
		var bottom_gem = instance_position(xx, yy, obj_gem)
		var new_acc = 0
		while(bottom_gem != noone) {
			yy = bottom_gem.y - 64
			new_acc = bottom_gem.acc
			bottom_gem = instance_position(xx, yy, obj_gem)
		}
		var g = instance_create_layer(xx, yy, "L_Gems", obj_gem)
		g.acc = new_acc
		gem_coords_update(k, j_index, g)
		k--
	}

}