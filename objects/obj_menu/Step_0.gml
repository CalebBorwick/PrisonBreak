#macro SAVEFILE "Save.sav"
menuX += (menuXTarg - menuX) /menuSpeed;
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
keyEnter = keyboard_check_pressed(vk_enter);

//controls 
if(menu_control){
	if(keyUp){
		menu_cursor ++;
		if(menu_cursor >= menu_items) menu_cursor =0;
	}
	if(keyDown){
		menu_cursor --;
		if(menu_cursor < 0) menu_cursor =menu_items-1;
	}
	if(keyEnter){
		menuXTarg = gui_width+200;
		menu_committed = menu_cursor;
		menu_control = false;
	}
	
}
	

if(menuX >= gui_width+150) && (menu_committed !=-1){
	switch (menu_committed)
	{
		case 2: script_execute(transition,TRANS_MODE.NEXT); break;
		case 1: {
			if(!file_exists(SAVEFILE)){
			script_execute(transition,TRANS_MODE.NEXT);
			}
			else{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				script_execute(transition, TRANS_MODE.GOTO, target);
			}
			break;
		}
		case 0: game_end(); break;
	}
}