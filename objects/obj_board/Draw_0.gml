/// @description
draw_self()
for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
	var s = -1
	if (global.board_gems_fallen[i][j] != noone) s = global.board_gems_fallen[i][j].image_index
	draw_text(8 + 16*j, 8 + 16*i, s)
}
draw_text(16, 256, fps_real)
