
function player_col(){
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


function player_Collision(){
	var _collision =false;
	

	if (hSpd >0) bbox_side = bbox_right; else bbox_side = bbox_left;
	//horizontal tiles
	if (tilemap_get_at_pixel(collisionMap, bbox_side+hSpd, bbox_top)!= 0)|| (tilemap_get_at_pixel(collisionMap, bbox_side+hSpd, bbox_bottom)!=0){
		if(hSpd>0){
			x = x-(x mod 32) +31 - (bbox_right - x);
		}
		else{
			x = x-(x mod 32) - (bbox_left -x);	
		}
		hSpd = 0;
		
		_collision = true
		if(state = player_state_swing){
			ropeAngle = point_direction(grappleX, grappleY, x, y+1);
			ropeAngleVelocity = 0;
		}
	}
	
	//horizontal movement commit
	x+=hSpd;
	vSpd = vSpd+grav;
	
	//vertical tiles
	if (vSpd >0)  bbox_side = bbox_bottom; else bbox_side = bbox_top;

	if (tilemap_get_at_pixel(collisionMap,bbox_left, bbox_side+ceil(vSpd))!= 0)|| (tilemap_get_at_pixel(collisionMap, bbox_right,bbox_side+ceil(vSpd))!=0){
		if(vSpd<0){
				y = y-(bbox_top mod 32);	
			}
			vSpd = 0;
		
		_collision = true
		if(state = player_state_swing){
			ropeAngle = point_direction(grappleX, grappleY, x, y+1);
			ropeAngleVelocity = 0;
		}
	}
	//vertical movement commit
	y=y+vSpd;
	
	//flip direction to char movement 
	if(hSpd != 0) image_xscale = sign(hSpd);
	

	return _collision;
}