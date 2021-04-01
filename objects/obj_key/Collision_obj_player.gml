with(obj_player){
	keyNum ++;
	audio_play_sound(keys, 5, false);
	instance_destroy(other);
}