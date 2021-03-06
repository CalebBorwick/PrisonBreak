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
	if(hasRope == true) &&(mouse_check_button_pressed(mb_left)){
		audio_play_sound(swing,5,false);
		grappleX = mouse_x;
		grappleY = mouse_y;
		ropeX = x;
		ropeY = y;
		ropeAngleVelocity  = 0;
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeLength = point_distance(grappleX, grappleY,x,y);
		state = player_state_swing;
	}
	if(mouse_check_button_pressed(mb_right))&& (potionNum>0){
		state= player_state_throw;	
	}
	
}

function player_state_jump(){
	var _move = keyRight - keyLeft;
	hSpd = _move *walkSpd;


	if(sprite_index!= spriteJump){
		sprite_index = spriteJump
		//Jumps
		if(vSpd==0){
			audio_play_sound(jump,5,false);
			vSpd = -8;

		}
		image_speed = 0;
		if(sign(vSpd) >0 )image_index = 1; else image_index = 0;
	}
	
	
	var _col = script_execute(player_Collision);
	if(hasRope == true) &&(mouse_check_button_pressed(mb_left)){
		audio_play_sound(swing,5,false);
		grappleX = mouse_x;
		grappleY = mouse_y;
		ropeX = x;
		ropeY = y;
		ropeAngleVelocity  = 0;
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeLength = point_distance(grappleX, grappleY,x,y);
		state = player_state_swing;
	}
	if(mouse_check_button_pressed(mb_right))&& (potionNum>0){
		state= player_state_throw;	
	}

	if(vSpd ==0){
		state = player_state_free;
	}
}

function player_state_dead(){
	hSpd = 0;
	vSpd = grav+3;
	var _col = script_execute(player_Collision)

		if(sprite_index != spriteDead){
			audio_play_sound(death,5,false);
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
					room_restart();
					state= player_state_free;
			
				}
			}
		}
	
	
}
	
function player_state_swing(){
		var ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		ropeAngleAcceleration += (keyRight-keyLeft) *0.02;

		ropeLength = max(ropeLength,0);
		ropeAngleVelocity += ropeAngleAcceleration;
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.99;
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
		hSpd = ropeX -x;
		vSpd = ropeY-y;
		var col = script_execute(player_Collision)
		
		if(mouse_check_button_released(mb_left)) || (col){
			vSpd = -4;
			state = player_state_jump;
			
		}
		
}

function player_state_chaser_dead(){
	hSpd = 0;
	vSpd = grav+3;
	var _col = script_execute(player_Collision)

		if(sprite_index != spriteDead){
			audio_play_sound(death,5,false);
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
					room_restart();
			
				}
			}
		}
	
	
}
	
function player_state_throw(){
	instance_create_depth(x,y,-100, obj_potion_throwable);
	state= player_state_free;


}
function player_state_locked(){}
