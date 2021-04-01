with(obj_player){
	potionNum ++;
	audio_play_sound(potionPickup, 5, false);
	instance_destroy(other);
}