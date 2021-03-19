if(instance_exists(follow)){
		xTo = follow.x;
		yTo = follow.y;
		
}

x+=(xTo - x) /25;
y += (yTo - y) /25;

x = clamp(x,viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

camera_set_view_pos(camera,x-viewWidthHalf, y-viewHeightHalf);