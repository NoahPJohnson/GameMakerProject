///Hitstun
grv = 0.8;  
stopped = false;
firing = false;
meleeAttack = false;

alarm[0] = -1;
alarm[7] = -1;
alarm[8] = -1;

if (hitstun == false)
   {
    if ((place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player) || place_meeting(x,y+1,obj_enemy)) || air_recovery == true)
       {
        show_debug_message("Hitstun is REALLY over");
        //sprite_index = spr_player_charging;
        stopped = true;
        speed = 0;
        direction = 0;
        state = e_state.idle;
       }
   }
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.alarm[0] = 1;
   }
if (!place_meeting(x,y+vspeed, obj_boundary) && !place_meeting(x,y+vspeed, obj_player) && !place_meeting(x,y+1,obj_enemy))   
   {
    vspeed += grv;
   }
else
   {
    vspeed += 0;
   }   

//Friction
if (place_meeting(x,y+1,obj_boundary))
   {
    if (hspeed > 0) 
       {
        hspeed -= frc;
       }
    if (hspeed < 0) 
       {
        hspeed += frc;
       }            
   }    
if (abs(hspeed) < 1)
   {
    hspeed = 0;
   }

//Max Speed
if (abs(speed) > mxspd)
   {
    speed = speed/abs(speed) * mxspd;
   }

//Hit Another Enemy
scr_enemy_collision_hitstun();

//Hit by Bat      
scr_hit_by_bat();

//Out of hp
scr_enemy_hp_zero();  

//Bounce
scr_collision_bounce();


   
   
