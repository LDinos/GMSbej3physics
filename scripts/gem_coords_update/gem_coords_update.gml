/// @function gem_coords_update(i, j, gem)
/// @description Adds gem on global.board_gems_fallen[i][j] and updates yend (= where to fall)
/// @param {integer} i row
/// @param {integer} j column
/// @param {object} gem gem instance
function gem_coords_update(i, j, gem) {
	global.board_gems_fallen[i][j] = gem
	gem.yend = obj_board.y + 32 + i*64
}