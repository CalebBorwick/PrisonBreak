with(obj_player){
	if(keyNum>0){
		if(other.key_unlock ==false){
			keyNum--;
		}
		other.key_unlock = true;
	
	}
}


