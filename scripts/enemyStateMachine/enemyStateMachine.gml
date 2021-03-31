 function gaurd_walk(){
	 sprite_index = spr_move;
	//at destination
	if(x==xTo) || (time_passed >enemy_wander_distance/enemy_speed){
		sprite_index = spr_idle;
		hSpd =0;

			
		if(++wait >= wait_duration){
			wait =0;
			time_passed = 0;
			dir = point_direction(x,y,xstart,ystart) +irandom_range(-45,45);
			xTo = x +lengthdir_x(enemy_wander_distance, dir);
			}
	}
	//move towards new destination
	else{
		time_passed++;
		image_speed = 1.0;
		var _distance_to_go =point_distance(x,y,xTo,y);
		var _speed_this_frame = enemy_speed;
		if(_distance_to_go <enemy_speed) _speed_this_frame = _distance_to_go;
		dir = point_direction(x,y,xTo,yTo);
		hSpd = lengthdir_x(_speed_this_frame,dir);
		if(hSpd !=0) image_xscale = sign(hSpd);
		
		//collisions
		script_execute(enemy_tile_collision);
	
	}


 }

function gaurd_attack(){
	image_xscale = -sign(target.x);
	sprite_index = spr_attack;
	audio_play_sound(attack,5,false);
	if(image_index >5){
		image_speed = 0;
		state_target = gaurd_walk;
		state_wait_duration = 15;
		state = enemy_wait;
	}
}

function enemy_wait(){

	if(++state_wait >= state_wait_duration){
		state_wait = 0;
		state = state_target;
	}

}