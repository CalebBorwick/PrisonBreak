
var unlock = true;
//audio_play_sound(lever,5,false);

if (unlock){
	image_speed = 1;
	if(image_index > 2){
		image_index = 2;
		image_speed =0; 
	}
	with(obj_door){
		image_speed = 1;
		if(image_index > 8){
			image_index = 9;
			image_speed =0; 
			solid = false;
		}
	}
}
