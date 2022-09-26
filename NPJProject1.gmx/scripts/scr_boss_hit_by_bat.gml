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
        if (vulnerable == true)
        {
            hp -= (1 + obj_player.chargeOne + (obj_player.chargeTwo*2));
            if (hp < 1)
            {
                scr_score_tracker_script_run(1 + obj_player.chargeOne + (obj_player.chargeTwo*2), true, (state == e_state.crash));
            }
            else
            {
                scr_score_tracker_script_run(1 + obj_player.chargeOne + (obj_player.chargeTwo*2), false, (state == e_state.crash)); 
            }
            //scr_enemy_hp_zero();
            old_speed = speed;
            impetus = (13 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10)) * weight_factor;
            hitstun_direction = 0;
            old_state = state;
            
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
                        scr_prompt_sound(snd_player_hit_enemy_SFX,other,false);    
                    }
                }
            }  
            
            //alarm[7] = -1;
            alarm[0] = room_speed * ((((hp < 1)*55) + (5 + (obj_player.chargeTwo*2)))/60);
            damage_hitstop = true;
        }
        else
        {
            old_state = state;
            
            //Hit protector sound effect
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
                }
            }
                
            alarm[0] = room_speed * (3/60);
            damage_hitstop = false;          
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
        state = boss_state.hitstop;
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
        if (vulnerable == true)
           {
            hp -= (1 + obj_player.chargeOne + (obj_player.chargeTwo*2));
            if (hp < 1)
               {
                scr_score_tracker_script_run(1 + obj_player.chargeOne + (obj_player.chargeTwo*2), true, (state == e_state.crash));
               }
            else
               {
                scr_score_tracker_script_run(1 + obj_player.chargeOne + (obj_player.chargeTwo*2), false, (state == e_state.crash)); 
               }
            //scr_enemy_hp_zero();
            old_speed = speed;
            impetus = (13 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10)) * weight_factor;
            hitstun_direction = (90-(obj_player.chargeOne*10)-(obj_player.chargeTwo*20)) * hitdir;
            old_state = state;
            
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
                        scr_prompt_sound(snd_player_hit_enemy_SFX,other,false);    
                    }
                }
            }  
            
            alarm[0] = room_speed * ((((hp < 1)*55) + (5 + (obj_player.chargeTwo*2)))/60);
            show_debug_message("Vulnerable spot hit, alarm 0 = " + string(room_speed * ((((hp < 1)*50) + (5 + (obj_player.chargeTwo*2)))/60)));
            damage_hitstop = true;
           }
        else
           {
            old_state = state;
            
            //Hit protector sound effect
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
                }
            }
            
            alarm[0] = room_speed * (3/60);
            damage_hitstop = false;
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
        state = boss_state.hitstop;
        show_debug_message("Hit by launcher. State is now: " + string(state));
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
        if (vulnerable == true)
           {
            hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);
            if (hp < 1)
               {
                scr_score_tracker_script_run(1, true, (state == e_state.crash));
               }
            else
               {
                scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
               }
            //scr_enemy_hp_zero();
            old_speed = speed;
            if (hitstun == false && place_meeting(x,y+1, obj_boundary))
               {
                impetus = 7 * weight_factor;
                hitstun_direction = 60 * hitdir;
                //speed = (abs(speed) * hitdir) + (impetus * hitdir);
                //direction = 60 * hitdir;
               }
            else
               {
                impetus = 7 * weight_factor;
                hitstun_direction = -60 * hitdir;
                //speed = (abs(speed) * hitdir) + (impetus * hitdir);
                //direction = -60 * hitdir;
               }
            old_state = state;
            
            //Hit sound effect
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_enemy_SFX,other,false);    
                }
            }
            
            alarm[0] = room_speed * ((((hp < 1)*55) + 3)/60);
            //show_debug_message("Hit by spike. player state is: " + string(obj_player.state) + " old state is " + string(obj_player.old_state));
            damage_hitstop = true;
           }
        else
           {
            old_state = state;
            
            //Hit protector sound effect
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
                }
            }
            
            alarm[0] = room_speed * (3/60);
            damage_hitstop = false;
           }
        state = boss_state.hitstop;
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        if (obj_player.alarm[7] == -1)
           {
            obj_player.alarm[7] = room_speed * (20/60);
           }
    
        obj_player.iframes = true;
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
    
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
    else
       {
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        if (obj_player.alarm[7] == -1)
           {
            obj_player.alarm[7] = room_speed * (20/60);
           }
        
        //Hit protector sound effect
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
            }
        }
    
        obj_player.iframes = true;
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
       }
   }

/*if (place_meeting(x,y,obj_bunt_bat) && obj_bunt_bat.hit == false && hitstun == false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    if (vulnerable == true)
       {
        hp -= 1;
        if (hp < 1)
           {
            scr_score_tracker_script_run(1, true, (state == e_state.crash));
           }
        else
           {
            scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
           }
        //scr_enemy_hp_zero();
        old_speed = 0;
        impetus = 5 * weight_factor;
        hitstun_direction = 20 * hitdir;
        old_state = state;
        alarm[0] = room_speed * (3/60);
       
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = alarm[0];
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        damage_hitstop = true;
        state = boss_state.hitstop;
       }
   }*/    

//Hit by explosion
if (place_meeting(x,y,obj_explosion_hitbox) && hitstun == false)
   {
    if (x < obj_explosion_hitbox)
       {
        hitdir = -1;
       }
    else
       {
        hitdir = 1;
       }
    if (vulnerable == true)
       {
        hp -= 1;
        if (hp < 1)
           {
            scr_score_tracker_script_run(1, true, (state == e_state.crash));
           }
        else
           {
            scr_score_tracker_script_run(1, false, (state == e_state.crash)); 
           }
        //scr_enemy_hp_zero();
        old_speed = 0;
        impetus = 19 * weight_factor;
        hitstun_direction = 75 * hitdir;
        old_state = state;
        //alarm[7] = -1;
        alarm[0] = room_speed * ((((hp < 1)*55) + 5)/60);
        damage_hitstop = true;
        show_debug_message("Head hit by an explosion.");
       }
    else
       {
        old_state = state;
        alarm[0] = room_speed * (3/60);
        damage_hitstop = false;
       }
    state = boss_state.hitstop;
   }

//Environment Damage  
if (place_meeting(x,y,obj_spike_floor) && hitstun == false)
   {
    if (vulnerable == true)
       {
        if (!place_meeting(x,y,obj_fire_hitbox_blocker))
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
            //scr_enemy_hp_zero();
            old_speed = 0;
            impetus = 18;
            hitstun_direction = 90;
            old_state = state;
            //alarm[7] = -1;
            alarm[0] = room_speed * ((((hp < 1)*55) + 5)/60);
            damage_hitstop = true;
            state = boss_state.hitstop;
           }
       }
    else
       {
        if (place_meeting(x,y,obj_fire_hitbox_boss))
           {
            fire_meeting = instance_place(x,y,obj_fire_hitbox_boss);
            fire_meeting.alarm[0] = 1;
           }
       }
   }
if (place_meeting(x,y,obj_spike_wall_L) && hitstun == false)
   {
    if (vulnerable == true)
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
        //scr_enemy_hp_zero();
        old_speed = 0;
        impetus = 16;
        hitstun_direction = 35;
        old_state = state;
        //alarm[7] = -1;
        alarm[0] = room_speed * ((((hp < 1)*55) + 5)/60);
        damage_hitstop = true;
        state = boss_state.hitstop;
       }
   }
if (place_meeting(x,y,obj_spike_wall_R) && hitstun == false)
   {
    if (vulnerable == true)
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
        //scr_enemy_hp_zero();
        old_speed = 0;
        impetus = 16;
        hitstun_direction = 145;
        old_state = state;
        //alarm[7] = -1;
        alarm[0] = room_speed * ((((hp < 1)*55) + 5)/60);
        damage_hitstop = true;
        state = boss_state.hitstop;
       }
   }
if (place_meeting(x,y,obj_spike_ceiling) && hitstun == false)
   {
    if (vulnerable == true)
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
        //scr_enemy_hp_zero();
        old_speed = 0;
        impetus = 14;
        hitstun_direction = 270;
        old_state = state;
        //alarm[7] = -1;
        alarm[0] = room_speed * ((((hp < 1)*55) + 5)/60);
        damage_hitstop = true;
        state = boss_state.hitstop;
       }
   }              
