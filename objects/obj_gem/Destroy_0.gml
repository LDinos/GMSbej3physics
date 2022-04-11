/// @description
if !(am_zombie) {
	if (killed_by_match) { //if i got matched, create a zombie gem on my place exactly
		var g = instance_create_layer(x, y, "L_Gems", obj_gem)
		g.image_index = image_index
		g.am_zombie = true
		g.match_id = match_id
		global.board_gems[i_index][j_index] = g
		global.board_gems_fallen[i_index][j_index] = g
	}
} else { //If I am zombie gem..
	global.board_gems[i_index][j_index] = noone
	global.board_gems_fallen[i_index][j_index] = noone
	var column_list = [j_index]
	if (match_id != NO_MATCH_ID) with(obj_gem) if (match_id = other.match_id) && (id != other.id) {
		global.board_gems[i_index][j_index] = noone
		global.board_gems_fallen[i_index][j_index] = noone
		if (j_index != other.j_index) array_push(column_list, j_index)
		instance_destroy(id, false)
	}
	for(var i = 0; i < array_length(column_list); i++) {
		var j = column_list[i]
		update_gems_fallen_aboveme(i_index, j)
	}
	match_find()
}
with(obj_swapper) if (gem1 == other.id) gem1 = noone
