with(obj_player){
	if(hascontrol){
		hascontrol = false;
		script_execute(transition, TRANS_MODE.GOTO, other.target);
		audio_play_sound(transitionsound,5,false);
	}
	
}