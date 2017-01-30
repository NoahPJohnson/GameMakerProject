///Hitstun  
hitstun = true;
stopped = false;
alarm[0] = -1;
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.alarm[0] = 1;
   }
if (!place_meeting(x,y+vspeed, obj_boundary))   
   {
    vspeed += 0.8;
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
if (abs(speed) < 1)
   {
    speed = 0;
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

//Bounce
scr_collision_bounce();

if (alarm[1] = -1)
   {
    alarm[1] = 13;   
   }
   
   
