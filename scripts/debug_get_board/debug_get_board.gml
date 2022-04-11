/// @function debug_get_board(board)
/// @description Throws a message for the input 2D board
/// @param {array} board The 2D board array
function debug_get_board(board) {
	var st = ""
	for(var i = 0; i < 8; i++) {
		for(var j = 0; j < 8; j++) {
			if board[i][j] != noone st += string(board[i][j].image_index) + " "
			else st += "X "
		}
		st += "\n"
	}
	return st
}

