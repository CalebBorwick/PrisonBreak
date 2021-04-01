with(obj_player){
	potionNum ++;
	audio_play_sound(potionPickup, 5, false); // potion pick up sound
	instance_destroy(other);
}