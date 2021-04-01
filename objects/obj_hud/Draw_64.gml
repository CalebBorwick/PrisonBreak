with(obj_player){
	if(keyNum>0){
		for (var i = 1; i<= keyNum; i++){
			draw_sprite_stretched(spr_keys, 0, 50+((i-1)*20),710, 64, 64);
		}
		
	}
	if(hasRope){
		draw_sprite_stretched(spr_rope, 0, 4,710, 64, 64);
	}
	if(potionNum>0){
		for (var i = 1; i<= potionNum; i++){
			draw_sprite_stretched(spr_potion, 0, 1200+((i+1)*20),700, 64, 64);
		}
		
	}
		
}