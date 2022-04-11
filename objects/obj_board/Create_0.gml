/// @description
global.skins = 6
randomize()
global.board_gems=[]
global.board_gems_fallen=[]
for(var i = 0; i < 8; i++) {
	global.board_gems[i] = []
	global.board_gems_fallen[i] = []
	for(var j = 0; j < 8; j++) {
		global.board_gems[i][j] = noone
		global.board_gems_fallen[i][j] = noone
	}
}

for(var i = 0; i < 8; i ++) {
	for(var j = 0; j < 8; j++) {
		gem_create(x + j*64 + 32, y - i*64)
	}
}

match_find()
