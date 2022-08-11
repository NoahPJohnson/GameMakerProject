///Projectile Normal
//Collision with Bat
if (place_meeting(x, y, obj_bat))
   {
    //Projectile Hitstop
    if (alarm[0] == -1)
       {
        alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
       }
    if (obj_player.right == true)
       {
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        if (direction >= 135 && direction <= 225)
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 0;
           }
        state = proj_state.hitstop;
       }
    else
       {
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        if ((direction >= 315 && direction <= 360) || (direction <= 45 && direction >= 0))
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 180;
           }
        state = proj_state.hitstop;
       }
    alarm[2] += 200;
    hp += obj_player.chargeOne + (obj_player.chargeTwo*2);
    spark_index = 2;
    if (instance_exists(obj_music_sfx_manager))
    {
        with (obj_music_sfx_manager) 
        {
            scr_prompt_sound(snd_player_hit_projectile_SFX,other,false);    
        }
    }
    
    //Player Hitstop
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;  
        obj_player.state = states.hitstop;
       }    
   }

   
//Collision with Launcher
if (place_meeting(x, y, obj_bat_launcher))
   {
    if (obj_player.right = true)
       { 
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo*2);
        if (direction >= 225 && direction <= 270)
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 70;
           }
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        if (direction >= 270 && direction <= 315)
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 110;
           }
        state = proj_state.hitstop;
       }
    alarm[2] += 200;
    hp += obj_player.chargeOne + obj_player.chargeTwo;
    spark_index = 2;
    //Player Hitstop
   
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;  
        obj_player.state = states.hitstop;
       }   
   }


//Collision with Spike   
if (place_meeting(x, y, obj_bat_spike))
   {
    if (obj_player.right = true)
       { 
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        if (direction >= 90 && direction <= 150)
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 285;
           }
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 18 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        if (direction >= 30 && direction <= 90)
           {
            struck_direction = direction + 180;
           }
        else
           {
            struck_direction = 255;
           }
        state = proj_state.hitstop;
       }
    alarm[2] += 200;
    spark_index = 2;
   }
   
//Collision with Bunt   
if (place_meeting(x,y,obj_bunt_bat))
   {
    bunted = true;
    obj_player.sp -= 20;
    if (obj_player.right = true)
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 4;
        struck_direction = 55;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 4;
        struck_direction = 125;
        state = proj_state.hitstop;
       }
    spark_index = 2;
    //Player Hitstop
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;
        obj_player.state = states.hitstop;
       }  
   } 

//Collision
scr_collision_ricochet();            
