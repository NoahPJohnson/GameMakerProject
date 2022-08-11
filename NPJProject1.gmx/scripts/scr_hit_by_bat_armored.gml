if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        if (obj_player.right = true)
           {
            hitdir = 1; 
           }
        else
           {
            hitdir = -1;
           }
    
        hp -= (0 + obj_player.chargeOne + (obj_player.chargeTwo*2));
        if (hp < 1)
           {
            scr_score_tracker_script_run(0 + obj_player.chargeOne + (obj_player.chargeTwo*2), true, (state == e_state.crash));
           }
        else
           {
            scr_score_tracker_script_run(0 + obj_player.chargeOne + (obj_player.chargeTwo*2), false, (state == e_state.crash)); 
           }
        scr_enemy_hp_zero();
        if (obj_player.chargeOne || obj_player.chargeTwo)
           {
            old_speed = speed;
            impetus = 5 + (obj_player.chargeOne * 7) + (obj_player.chargeTwo * 15);
            hitstun_direction = 0;
            old_state = state;
            alarm[7] = -1;
            alarm[9] = room_speed * ((5 + (obj_player.chargeTwo*2))/60);
            damage_hitstop = true;
           }
        else
           {
            old_state = state;
            alarm[9] = room_speed * (3/60);
            damage_hitstop = false;
           }
           
        //Hit Sound Effect
        if (instance_exists(obj_music_sfx_manager))
        {
            if (obj_player.chargeOne == true)
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_enemy_charge_lv1_SFX,other,false);    
                }
            }
            else if (obj_player.chargeTwo == true)
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_enemy_charge_lv2_SFX,other,false);    
                }
            }
            else
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
                }
            }
        }
        
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = alarm[9];
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        //damage_hitstop = true;
        state = e_state.hitstop;
       }   
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit == false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        if (obj_player.right = true)
           {
            hitdir = 1; 
           }
        else
           {
            hitdir = -1;
           }
        hp -= (0 + obj_player.chargeOne + (obj_player.chargeTwo*2));
        if (hp < 1)
           {
            scr_score_tracker_script_run(0 + obj_player.chargeOne + (obj_player.chargeTwo*2), true, (state == e_state.crash));
           }
        else
           {
            scr_score_tracker_script_run(0 + obj_player.chargeOne + (obj_player.chargeTwo*2), false, (state == e_state.crash)); 
           }
        scr_enemy_hp_zero();
        if (obj_player.chargeOne || obj_player.chargeTwo)
           {
            old_speed = speed;
            impetus = 5 + (obj_player.chargeOne * 8) + (obj_player.chargeTwo * 16);
            hitstun_direction = (90-(obj_player.chargeOne*0)-(obj_player.chargeTwo*10)) * hitdir;
            old_state = state;
            alarm[7] = -1;
            alarm[9] = room_speed * ((5 + (obj_player.chargeTwo*2))/60);
            damage_hitstop = true;
           }
        else
           {
            old_state = state;
            alarm[9] = room_speed * (3/60);
            damage_hitstop = false;
           }
        
        //Launcher Hit Sound Effect
        if (instance_exists(obj_music_sfx_manager))
        {
            if (obj_player.chargeOne == true)
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_enemy_charge_lv1_SFX,other,false);    
                }
            }
            else if (obj_player.chargeTwo == true)
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_enemy_charge_lv2_SFX,other,false);    
                }
            }
            else
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
                }
            }
        }
           
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = alarm[9];
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        
        state = e_state.hitstop;
        //show_debug_message("Hit by launcher. State is now: " + string(state));
        //show_debug_message("Hit by the LAUNCHER! " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       } 
   }          

if (place_meeting(x, y, obj_bat_spike) && obj_bat_spike.hit == false)
   {
    if (obj_player.right == true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        hp -= 0;
        if (hp < 1)
           {
            scr_score_tracker_script_run(0, true, (state == e_state.crash));
           }
        else
           {
            scr_score_tracker_script_run(0, false, (state == e_state.crash)); 
           }
        scr_enemy_hp_zero();
        //old_speed = speed;
        old_state = state;
        //alarm[7] = -1;
        alarm[9] = room_speed * (3/60);
        damage_hitstop = false;
        
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
            }
        }
        
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
    
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = alarm[9];
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        //show_debug_message("Hit by spike. player state is: " + string(obj_player.state) + " old state is " + string(obj_player.old_state));
        
        state = e_state.hitstop;
       }
    else
       {
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
            }
        }
       
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
       }
   }

if (place_meeting(x,y,obj_bunt_bat) && obj_bunt_bat.hit == false && hitstun == false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    hp -= 0;
    if (hp < 1)
       {
        scr_score_tracker_script_run(0, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(0, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    /*old_speed = 0;
    impetus = 5;
    hitstun_direction = 20 * hitdir;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (3/60);
    //Player Hitstop
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[9];
    if (obj_player.state != states.hitstop)
       {
        //watch out for a potential issue where player returns to wrong state. just in case
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    damage_hitstop = true;
    state = e_state.hitstop;*/
    //speed = ((abs(speed)*hitdir) * .7) + (impetus*hitdir);
    //direction = 20 * hitdir;
    /*hp -= 1;
    if (state != e_state.crash)
       {
        alarm[1] = room_speed * (12/60);
        hitstun = true;
        scr_collision_bounce();
        state = e_state.hitstun;
       }*/
   }    

//Hit by explosion or other neutral damage
if (place_meeting(x,y,obj_explosion_hitbox) && hitstun == false)
   {
    if (x < obj_explosion_hitbox.x)
       {
        hitdir = -1;
       }
    else
       {
        hitdir = 1;
       }
    hp -= 1;
    if (hp < 1)
       {
        scr_score_tracker_script_run(1, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 12;
    hitstun_direction = 75 * hitdir;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }     
   
//Environment Damage  
if (place_meeting(x,y,obj_spike_floor) && hitstun == false)
   {
    hitdir = 1;
    hp -= 1;
    if (hp < 1)
       {
        scr_score_tracker_script_run(1, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 13;
    hitstun_direction = 90;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }
if (place_meeting(x,y,obj_spike_wall_L) && hitstun == false)
   {
    hitdir = 1;
    hp -= 1;
    if (hp < 1)
       {
        scr_score_tracker_script_run(1, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 11;
    hitstun_direction = 35;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }
if (place_meeting(x,y,obj_spike_wall_R) && hitstun == false)
   {
    hitdir = 1;
    hp -= 1;
    if (hp < 1)
       {
        scr_score_tracker_script_run(1, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 11;
    hitstun_direction = 145;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }
if (place_meeting(x,y,obj_spike_ceiling) && hitstun == false)
   {
    hitdir = 1;
    hp -= 1;
    if (hp < 1)
       {
        scr_score_tracker_script_run(1, true, (state == e_state.crash));
       }
    else
       {
        scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
       }
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 9;
    hitstun_direction = 270;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }                     
