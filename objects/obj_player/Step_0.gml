if(hascontrol){
	keyJump = keyboard_check(vk_space);
	keyUp = keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
	keyRopeAttach = mouse_check_button(mb_left);
	keyRopeDetach = mouse_check_button(mb_right);
}
else{
	
	keyJump = 0;
	keyDown = 0;
	keyLeft=0;
	keyRight = 0;
}



if(y > 775){
	script_execute(transition, TRANS_MODE.GOTO, room);
}


	
script_execute(state);

