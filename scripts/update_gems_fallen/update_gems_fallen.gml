/// @function update_gems_fallen(g)
/// @description Takes a gem as input and finds out where it should go in the array (=where it will fall)
/// @param {object} g Gem object
function update_gems_fallen(g){
	var j = g.j_index
	for(var i = 7; i >= 0; i--) {
		if (global.board_gems_fallen[i][j] == noone) {
			gem_coords_update(i, j, g)
			break;
		}
	}
}