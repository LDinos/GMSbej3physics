/// @function gem_create(x, y)
/// @description Spawns a gem and instantly finds out where in the array it should go in
/// @param {real} x x coordinate to spawn in
/// @param {real} y y coordinate to spawn in
function gem_create(x, y){
	var g = instance_create_layer(x, y, "L_Gems", obj_gem)
	update_gems_fallen(g)
	return g;
}