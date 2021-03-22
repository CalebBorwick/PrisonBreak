//menu setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menuX = gui_width- 50;
menuY = gui_height-gui_margin;

menuXTarg = gui_width- gui_margin-50;

menuSpeed = 25;
menuFont = f_menu;

menuItemH = font_get_size(f_menu);
menu_committed = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_cursor = 2;
menu_items = array_length_1d(menu);
