lerpProgress+= (1-lerpProgress)/50;
textProgress+=textSpeed;

x1=lerp(x1,x1Targ, lerpProgress);
x2 = lerp(x2, x2Targ, lerpProgress);
if(keyboard_check_pressed(vk_space)){
	var _messageLength = string_length(mess);
	if (textProgress >= _messageLength){
		instance_destroy();
		if (instance_exists(obj_text_queued)){
			with (obj_text_queued){
				ticket--;
			}
		}
		else{
			with(obj_player) state = lastState;
		}
	}
	else {
		if (textProgress >2){
			textProgress = _messageLength;	
		}
	}
}