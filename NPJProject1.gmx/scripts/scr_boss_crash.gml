//Crash
alarm[0] = -1;
alarm[7] = -1;
//sprite_index = crash_sprite;


//Sparks
if (alarm[3] mod spark_interval >= 0 && alarm[3] mod spark_interval < 5)
{
    spark_interval = random_range(40,65);
    spark_offset_x = random_range(-19,19);
    spark_offset_y = random_range(-19,19);
    instance_create(x+spark_offset_x,y+spark_offset_y,obj_spark_effect1);
}

if (!place_meeting(x,y+abs(vspeed),obj_boundary) && !place_meeting(x,y+abs(vspeed),obj_player))   
   {
    //vspeed += 0.8;
    motion_add(270, 0.8);
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

//Hit by Bat      
scr_hit_by_bat();

//Bounce
scr_collision_bounce();
