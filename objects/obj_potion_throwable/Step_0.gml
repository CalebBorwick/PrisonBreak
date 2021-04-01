if (tilemap_get_at_pixel(collisionMap, x , y)){
	instance_destroy();
	instance_create_depth(x,y,-100,obj_particles);
	with(obj_player) potionNum --;
}

if(speed >0) &&(alarm[1] <=0){
	alarm[1] = distance;
}