///Enemy Chase
speed = 0;
direction = 0;
if (obj_player.state = states.knockback)
   {
    dir = 0;
    alarm[0] = -1; 
   }
   
vspd = (min(7, vspd + grv));
if (alarm[7] = -1 && alarm[8] = -1)
   {
    if (obj_player.sliding == false && jumping_type == false)
       { 
        dir = sign(obj_player.x - x);
       }
    else if (obj_player.sliding == false && jumping_type == true)
       {
        if (abs((obj_player.x+60) - x) < abs((obj_player.x-60) - x))
           {
            dir = sign((obj_player.x+60) - x)
           }
        else
           {
            dir = sign((obj_player.x-60) - x)
           } 
       }
    if (firing == false)
       {
        hspd = dir * chsSpeed;
       }
   } 
if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false))
       {
        alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
        first_shot = false; 
       }
   }
   
   
if (dir == -1)
   {
    image_xscale = -1;
   }
else if (dir == 1)
   {
    image_xscale = 1;
   }
   
   
if (jumping_type == true)
   {
    if ((place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && alarm[5] > 0)
       {
        jumping = false;
       }
    if ((place_meeting(x,y+1, obj_boundary)) && jumped == true)
       {
        hspd = 0;
        chsSpeed = 0;
        //sprite_index = spr_player_charging;
        if (alarm[6] = -1)
           {
            alarm[6] = room_speed * (90/60);
           }
       }
    else if (place_meeting(x,y+1, obj_player))
       {
        alarm[5] = 1;
       }   
    else if ((place_meeting(x,y+1, obj_boundary) || place_meeting(x,y+1, obj_player)) && alarm[5] == -1 && jumped == false)
       {
        alarm[5] = room_speed * (94/60);
       }
   }     

if (distance_to_object(obj_player) > 550)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    alarm[5] = -1;
    alarm[7] = -1;
    firing = false;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 128)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (jumping_type = true)
       {
        if (place_meeting(x, y+1, obj_boundary) && jumped = false)
           {
            alarm[5] = 1;
           }
       }
    else
       {
        if (meleeAttack = false)
           {
            hspd = dir * chsSpeed;
           } 
       } 
   }
   
//Melee Attack
scr_enemy_melee();
  
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat   
scr_hit_by_bat();

//Hit by a Projectile
scr_hit_by_projectile();

//Out of HP
scr_enemy_hp_zero();

//Collision with Enemy
//scr_enemy_collision();

//Collision
scr_collision();
