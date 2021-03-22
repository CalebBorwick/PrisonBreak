//draw menu

draw_set_font(f_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i< menu_items; i++){
	var offset = 2;
	var text = menu[i];
	if (menu_cursor ==i){
		text = string_insert("> ", text, 0);
		var colour = c_white;
	}
	else{
		var colour = c_gray;	
	}
	
	var xx = menuX;
	var yy = menuY - (menuItemH *(i * 1.5));
	
	draw_set_color(c_black);
	
	draw_text(xx-offset,yy, text);
	draw_text(xx+ offset,yy, text);
	draw_text(xx,yy+offset, text);
	draw_text(xx,yy-offset, text);
	
	draw_set_color(colour);
	draw_text(xx,yy,text);
	
}
draw_sprite(spr_logo, -1, gui_width*0.5	,gui_height*0.3);