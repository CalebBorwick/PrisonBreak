if (key_unlock){
	image_speed = 1;
	if(checkSound){
		audio_play_sound(doorOpen,5,false); // insert door sound
	}
	checkSound= false;
	if(image_index > 10){
		image_index = 11;
		image_speed =0; 
		solid = false;
	}

}