///Projectile Normal
//vspeed += 0.8;
motion_add(270,0.8);
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
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 0;
        state = proj_state.hitstop;
       }
    else
       {
        /*if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }*/
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 180;
        state = proj_state.hitstop;

       }
    alarm[2] += 25;
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
        
    //state = proj_state.struck;
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
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 70;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 110;
        state = proj_state.hitstop;
       }
    //Player Hitstop
    alarm[2] += 30;
    spark_index = 2;
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;  
        obj_player.state = states.hitstop;
       }    
    //state = proj_state.struck;
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
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 285;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 16 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 255;
        state = proj_state.hitstop;

       }
    alarm[2] += 30;
    spark_index = 2;
    //Player Hitstop
    /*obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[0];
    if (obj_player.state != states.hitstop)
       {
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;*/
    //show_debug_message("Projectile struck by spike. player state is: " + string(obj_player.state) + " for " + string(obj_player.alarm[11]) + " frames! ");  
    //state = proj_state.struck;
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
        struck_speed = 6;
        struck_direction = 55;
        state = proj_state.hitstop;
        //direction = 55;
        //speed = 4;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 6;
        struck_direction = 125;
        state = proj_state.hitstop;
        //direction = 125;
        //speed = 4;
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
    //state = proj_state.struck;
   } 

//Collision with Another Projectile
if (place_meeting(x,y,obj_projectile))
{
    var projectile_meeting = instance_place(x,y,obj_projectile);
    if (projectile_meeting.struck == true)
    {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
         
        struck_speed = projectile_meeting.speed * 0.8;
        struck_direction = projectile_meeting.direction;
        
        state = proj_state.hitstop;
        spark_index = 2;
        
        if (alarm[2] > 0)
        {
            alarm[2] = room_speed * (14/60);
        }
    }
}

//Collision with Explosion
if (place_meeting(x,y,obj_explosion_hitbox))
{
    var explosion_meeting = instance_place(x,y,obj_explosion_hitbox);

    if (alarm[0] == -1)
       {
        alarm[0] = room_speed * (3/60);
       }
     
    struck_speed = 20;
    struck_direction = point_direction(explosion_meeting.x, explosion_meeting.y, x, y);
    
    state = proj_state.hitstop;
    spark_index = 2;
    
    if (alarm[2] > 0)
    {
        alarm[2] = room_speed * (14/60);
    }
}      
   
//Collision
scr_collision_bounce();            
