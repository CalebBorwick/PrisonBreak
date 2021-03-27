with(obj_player){
	var unlock = false;
	
	if(hasKey){
		unlock = true;
	}
}
if (unlock){
	image_speed = 1;
	if(image_index > 8){
		image_index = 9;
		image_speed =0; 
		solid = false;
	}
}