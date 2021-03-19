
vSpd = vSpd+grav;

//edge check
if(grounded) && (ledgeCheck) && (!place_meeting(x+hSpd*15, y+1,obj_wall)){
	hSpd=-hSpd;
}

//horizontal collision
if(place_meeting(x+hSpd, y, obj_wall)){
	while(!place_meeting(x+sign(hSpd), y, obj_wall)){
		x = x+sign(hSpd);
	}
	
	hSpd=-hSpd;
}

x = x +hSpd;

//verticle collision
if(place_meeting(x, y+vSpd, obj_wall)){
	while(!place_meeting(x, y+sign(vSpd), obj_wall)){
		y = y+sign(vSpd);
	}
	
	vSpd=0;
}
y= y+vSpd;

image_speed = 1;
if(hSpd == 0){
	sprite_index = spr_gaurd_idle;	
}
else{
	sprite_index = spr_gaurd_walk;
}


//flip direction to char movement 
if(hSpd != 0) image_xscale = sign(hSpd);