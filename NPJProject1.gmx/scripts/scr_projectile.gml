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
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 0;
        state = proj_state.hitstop;
       }
    else
       {
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 180;
        state = proj_state.hitstop;
       }
    hp += obj_player.chargeOne + (obj_player.chargeTwo*2);
    spark_index = 2;
    
    //Play hit sound
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
        show_debug_message("Projectile caused player non-damage hitstop.");
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
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 70;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 110;
        state = proj_state.hitstop;
       }
    hp += obj_player.chargeOne + (obj_player.chargeTwo*2);
    spark_index = 2;
    
    //Play hit sound
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
        show_debug_message("Projectile caused player non-damage hitstop. (launcher)");
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
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 285;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
        struck_direction = 255;
        state = proj_state.hitstop;
       }
    spark_index = 2;
    
    //Play hit sound
    if (instance_exists(obj_music_sfx_manager))
    {
        with (obj_music_sfx_manager) 
        {
            scr_prompt_sound(snd_player_hit_projectile_SFX,other,false);    
        }
    }
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
    
    //Play bunt sound
    if (instance_exists(obj_music_sfx_manager))
    {
        with (obj_music_sfx_manager) 
        {
            scr_prompt_sound(snd_bunt_block_SFX,other,false);    
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
        

//Collsion with Wall and Prop
if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop) || place_meeting(x,y,obj_explosion_hitbox))
   {
    if (!place_meeting(x,y,obj_boss_canister))
       {
        selected_hit_spark = instance_create(x,y,shot_hit_sparks[spark_index]);
        selected_hit_spark.image_angle = image_angle;
        instance_destroy();
       }
   }

//Collision with Crashed Enemy   
if (place_meeting(x, y, obj_enemy))     
   {
    crashed_enemy_meeting = instance_place(x, y, obj_enemy);
    if (crashed_enemy_meeting.state == e_state.crash)
       {
        selected_hit_spark = instance_create(x,y,shot_hit_sparks[spark_index]);
        selected_hit_spark.image_angle = image_angle;
        instance_destroy();
       }
   }            
