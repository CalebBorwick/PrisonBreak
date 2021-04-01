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
	if(attackCheck == false){
			audio_play_sound(attack,5,false);
			attackCheck = true;
	}

	var side = sign(x - target.x); // maybe update
	switch (side)
	{
		case - 1: direction = 180; break;
		case 1: direction = 0; break;
	}
	sprite_index = spr_attack;
	if(image_index >5){
		image_speed = 0;
		state_target = gaurd_walk;
		state_wait_duration = 15;
		state = enemy_wait;
	}
}

function enemy_wait(){
	attackCheck = false;
	if(++state_wait >= state_wait_duration){
		state_wait = 0;
		state = state_target;
	}

}

function enemy_chase(){
	sprite_index = spr_move;
	image_speed = 1.0;
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToTarg = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if(_distanceToTarg >enemy_speed){
			hSpd = lengthdir_x(enemy_speed,dir);
			vSpd = lengthdir_y(enemy_speed, dir);
			
		}
		else{
			hSpd = lengthdir_x(_distanceToTarg,dir);
			vSpd = lengthdir_y(_distanceToTarg,dir);
		}
		if(hSpd !=0) image_xscale = sign(hSpd);
		
		enemy_tile_collision()
	
	}

	
}

function chaser_attack(){
	if(attackCheck == false){
			audio_play_sound(attack,5,false);
			attackCheck = true;
	}
	sprite_index = spr_attack;
	if(image_index >6){
		image_speed = 0;
		state_target = enemy_chase;
		state_wait_duration = 15;
		state = enemy_wait;
	}
}
	
function enemy_died(){
	sprite_index = spr_die;
	image_speed = 1.0;
	var _distance_to_go = point_distance(x,y,xTo,yTo);
	if (_distance_to_go >enemy_speed){
		dir = point_direction(x,y,xTo,yTo);
		hSpd = lengthdir_x(enemy_speed, dir);
		if(hSpd !=0) image_xscale = -sign(hSpd);
		
		//collide and commit to movement
		enemy_tile_collision();
	}
	else{
		x=xTo;
		y=yTo;
	}
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		 	instance_destroy();

	}
}