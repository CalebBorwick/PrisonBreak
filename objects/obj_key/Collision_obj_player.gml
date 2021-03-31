with(obj_player){
	hasKey = true;
	audio_play_sound(keys, 5, false);
	instance_destroy(other);
}