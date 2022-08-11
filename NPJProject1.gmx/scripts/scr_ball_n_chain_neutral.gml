///Neutral state
//swing around
struck = false;
alarm[1] = -1;
alarm[2] = -1;
stop = false;
if (enemy_parent != noone)
   {
    spin += room_speed * (0.1/60);
    x = enemy_parent.x + (48*sin(spin));
    y = enemy_parent.y-100;
    
    if (abs(x - enemy_parent.x) < 3) 
    {
        //Play swing sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
            }
        }
    } 
   }

//Blocked by Bunt
if (place_meeting(x,y,obj_bunt_bat))
   {
    obj_player.sp -= 30;
    
    //Play bunt sound
    if (instance_exists(obj_music_sfx_manager))
    {
        with (obj_music_sfx_manager) 
        {
            scr_prompt_sound(snd_bunt_block_SFX,other,false);    
        }
    }
    //Player Hitstop
    /*obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = room_speed * (3/60);
    if (obj_player.state != states.hitstop)
       {
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    
    //Enemy Hitstop
    enemy_parent.hitstop = false;
    enemy_parent.damage_hitstop = false;
    enemy_parent.alarm[9] = room_speed * (3/60);
    enemy_parent.old_state = enemy_parent.state;
    enemy_parent.state = e_state.hitstop;
    //instance_destroy();*/
   }

scr_ball_n_chain_links();
   
scr_ball_hit_by_bat();
