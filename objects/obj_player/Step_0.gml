if(hascontrol){
	keyJump = keyboard_check(vk_space) || keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
}
else{
	
	keyJump = 0;
	keyDown = 0;
	keyLeft=0;
	keyRight = 0;
}


script_execute(state);

	

