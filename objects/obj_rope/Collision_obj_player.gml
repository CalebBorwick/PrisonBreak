with(obj_player){
	hasRope = true;
	audio_play_sound(rope,5,false);
	instance_destroy(other);
}