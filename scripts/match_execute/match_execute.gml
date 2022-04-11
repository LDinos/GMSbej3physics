/// @function match_execute()
/// @description Executes the gems that were previously found out that they match
function match_execute(){
	am_stationary = true
	if (match_id != NO_MATCH_ID) {
		var m_id = match_id
		var temp_array = [] //array of gems that we will kill
		var n = 0 //number of stationary gems
		with(obj_gem) {
			if (match_id == m_id) {
				array_push(temp_array, id) //add it to the list of gems we should destroy
				if (am_stationary) n++ //also check the number of gems that are stationary
			}
		}
		if (n == array_length(temp_array)) { //if all gems that are supposed to be executed are all stationary
			for(var i = 0; i < n; i++) instance_destroy(temp_array[i]) //...kill them
		}
	}
}