
// Inherit the parent event
event_inherited();
collisionMap = layer_tilemap_get_id(layer_get_id("col"));
state = gaurd_walk;

time_passed = 0;
wait_duration = 60;
wait = 0;

xTo = xstart;
yTo = ystart;
dir = 0;


state_target = state;
state_previous = state;
state_wait = 0;
state_wait_duration = 0;

hSpd =2;
vSpd= 0;
grav = 0.3;
enemy_speed=2;
enemy_wander_distance = 100;
enemy_attack_radius = 100;

//Enemy Sprites
spr_move = spr_gaurd_walk;
spr_attack = spr_gaurd_attack;
spr_idle = spr_gaurd_idle

target = obj_player;