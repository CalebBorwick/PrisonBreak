function player_state_free(){
	var _move = keyRight - keyLeft;
	hSpd = _move *walkSpd;

	vSpd = vSpd+grav;
	image_speed = 1;
	if(hSpd == 0){
		sprite_index = spr_player_idle;	
	}
	else{
		sprite_index = spr_player_run;
	}
	script_execute(player_Collision)
	if(keyJump){
		state = player_state_jump;	
	}
}

function player_state_jump(){
	var _move = keyRight - keyLeft;
	hSpd = _move *walkSpd;


	if(sprite_index!= spriteJump){
		sprite_index = spriteJump
		//Jumps
		if(vSpd==0){
			vSpd = -8;

		}
		image_speed = 0;
		if(sign(vSpd) >0 )image_index = 1; else image_index = 0;
	}
	
	var _col = script_execute(player_Collision);
	if(vSpd ==0){
		state = player_state_free;
	}
}

function player_state_dead(){
	hSpd = 0;
	vSpd = grav+3;
	var _col = script_execute(player_Collision)

	
		if(sprite_index != spriteDead){
			sprite_index = spriteDead;
			image_index = 0;
			image_speed = 0.2;
		
		}
		if(image_index==3) image_speed =0;
		if(_col){
			image_speed = 1;

			if(image_index + image_speed > image_number){
				if (sprite_index == spriteDead){
					image_speed =0;
					image_index = image_number -1;
					x= xstart;
					y=ystart;
					state= player_state_free;
			
				}
			}
		}
	
	
}