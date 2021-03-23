hSpd =0;
vSpd= 0;
grav = 0.3;
walkSpd=4;
state=player_state_free;
lastState = state;
collisionMap = layer_tilemap_get_id(layer_get_id("col"));
hascontrol = true;

hasKey = false;
hasRope= false;
hasHeadlamp = false;

spriteRun = spr_player_run;
spriteIdle = spr_player_idle;
spriteDead = spr_player_died;
spriteJump = spr_player_jump;