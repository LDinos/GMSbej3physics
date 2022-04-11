#macro HORIZONTAL true
#macro VERTICAL false
#macro NO_MATCH_ID -1
/// @function match_find()
/// @description Searches the whole board for horizontal and vertical matches
function match_find() {
	with(obj_gem) if (!am_zombie) match_id = NO_MATCH_ID
	for(var i = 0; i < 8; i++) {
		match_search_direction(i, HORIZONTAL)
		match_search_direction(i, VERTICAL)
	}
}

/// @function match_search_direction(i, is_horizontal)
/// @description Part of match_find, it searches matches on specific direction (horizontal/vertical)
/// @param {integer} i iterator of first loop
/// @param {bool} is_horizontal is this horizontal (true) direction or vertical (false)?
function match_search_direction(i, is_horizontal) {
	var n = 1
	for(var j = 1; j < 8; j++) {
		var my_gem = is_horizontal ? global.board_gems_fallen[i][j] : global.board_gems_fallen[j][i]
		if (my_gem != noone) {
			var my_skin = my_gem.image_index
			var prev_gem =  is_horizontal ? global.board_gems_fallen[i][j-1] : global.board_gems_fallen[j-1][i]
			if (prev_gem != noone) {
				var prev_skin = prev_gem.image_index
				if (my_skin == prev_skin) && (!my_gem.am_zombie && !prev_gem.am_zombie) {
					n++
					if (j == 7) {match_commit(n,i,j,is_horizontal, true); n = 1}
				} else {match_commit(n,i,j,is_horizontal); n = 1}
			} else {match_commit(n,i,j,is_horizontal); n = 1}
		} else {match_commit(n,i,j,is_horizontal); n = 1}
	}
}

/// @function match_commitn(num_matches, i, j, is_horizontal)
/// @description Part of match_find, it gives match id's for all matched gems to be executed later on gem destroy event
/// @param {integer} num_matches number of matched gems
/// @param {integer} i first loop iterator
/// @param {integer} j second loop iterator
/// @param {bool} is_horizontal is the direction horizontal (true) or vertical (false)
/// @param {bool} last_check did the second loop reach its end and we still have to commit previous gems?
function match_commit(num_matches, i, j, is_horizontal, last_check = false) {
	if (num_matches < 3) return 0;
	var commited_gems = []
	var _start = last_check ? j : j-1
	var _end = last_check ? j - num_matches + 1 : j - num_matches
	var main_id = is_horizontal ? global.board_gems_fallen[i][_start] : global.board_gems_fallen[_start][i]
	array_push(commited_gems, main_id)
	if (main_id.match_id == NO_MATCH_ID) main_id.match_id = main_id //itself is on the group of matched gems
	else main_id = main_id.match_id
	for(var k = _start; k >= _end; k--) {
		var gem = is_horizontal ? global.board_gems_fallen[i][k] : global.board_gems_fallen[k][i]
		array_push(commited_gems, gem)
		if (gem.match_id == NO_MATCH_ID || gem.match_id == main_id) { gem.match_id = main_id }
		else {
			main_id = gem.match_id //we get a new main match id, change all gems we have in the list so far to that id
			for(var p = 0; p < array_length(commited_gems); p++) { commited_gems[p].match_id = main_id}
		}
	}
}
