
function player_Collision(){
	var _collision =false;
	


	//horizontal tiles
	if (tilemap_get_at_pixel(collisionMap, x +hSpd, y)){
		hSpd=0;
		_collision = true
		if(state = player_state_swing){
			ropeAngle = point_direction(grappleX, grappleY, x, y);
			ropeAngleVelocity = 0;
		}
	}
	
	//horizontal movement commit
	x+=hSpd;
	vSpd = vSpd+grav;
	//vertical tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpd)){

		vSpd = 0;
		_collision = true
		if(state = player_state_swing){
			ropeAngle = point_direction(grappleX, grappleY, x, y);
			ropeAngleVelocity = 0;
		}
	}
	
	//vertical movement commit
	y+=vSpd;
	
	//flip direction to char movement 
	if(hSpd != 0) image_xscale = sign(hSpd);
	

	return _collision;
}