keyJump = keyboard_check(vk_space) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));

//calc movement
var _move = keyRight - keyLeft;
hSpd = _move *walkSpd;

vSpd = vSpd+grav;

if(place_meeting(x,y+1,obj_wall)) && (keyJump){
		vSpd = -7;
}

//horizontal collision
if(place_meeting(x+hSpd, y, obj_wall)){
	while(!place_meeting(x+sign(hSpd), y, obj_wall)){
		x = x+sign(hSpd);
	}
	
	hSpd=0;
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