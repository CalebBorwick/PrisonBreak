script_execute(state);

if(instance_exists(obj_player)) && (point_distance(x,y,obj_player.x, obj_player.y) <=enemy_aggro_radius){
	state = enemy_chase;
	target = obj_player;
			
	}