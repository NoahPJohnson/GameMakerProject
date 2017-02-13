//Crash
alarm[0] = -1;

sprite_index = spr_player_charging;
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
   
//Hit by Projectile
/*if (place_meeting(x, y, obj_projectile))
   {
    
   }*/      

if (abs(speed) < 1.6 && place_meeting(x,y+1,obj_boundary))
   {
    speed = 0;
    stopped = true;
   }
else
   {
    stopped = false;
   }
//Max Speed
if (abs(speed) > mxspd)
   {
    speed = speed/abs(speed) * mxspd;
   }

//Hit Another Enemy
scr_enemy_collision_hitstun();

//Out of CP   
scr_enemy_cp_zero();  

//Hit by Bat      
scr_hit_by_bat();

//Bounce
scr_collision_bounce();
