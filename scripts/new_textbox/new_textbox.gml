
function new_textbox(){
	var _obj;
	if (instance_exists(obj_text)) _obj = obj_text_queued; else _obj = obj_text;
	with(instance_create_layer(0,0, "player", _obj)){
			mess = argument[0];
			if (instance_exists(other)) originInstance = other.id else orignInstance = noone; 
			if (argument_count >1) background = argument[1]; else background =1;
	}
	with(obj_player){
		if (state != player_state_locked){
			lastState = state;
			state = player_state_locked;
		}
	}

}