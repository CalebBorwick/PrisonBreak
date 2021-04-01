
function enemy_tile_collision(){
	var _collision =false;
	if(grounded) && (ledgeCheck) &&(!tilemap_get_at_pixel(collisionMap, x +hSpd, y+1)){
		hSpd = -hSpd;
	}


	//horizontal tiles
	if (tilemap_get_at_pixel(collisionMap, x +hSpd, y)){
		hSpd=0;
		_collision = true;

	}
	
	//horizontal movement commit
	x+=hSpd;
	vSpd = vSpd+grav;
	//vertical tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpd)){

		vSpd = 0;
		_collision = true;

	}
	
	//vertical movement commit
	y+=vSpd;
	

	return _collision;
}