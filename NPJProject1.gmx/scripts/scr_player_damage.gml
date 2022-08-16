if (place_meeting(x, y, obj_projectile) && iframes = false && siframes = false && invincibility_active == false)
   {   
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck == false)
       {
        if (projectile_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 11;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            if (drive == false)
               {
                //Cancel existing properties
                crouching = false;
                charging = false;
                chargeOne = false;
                chargeTwo = false;
                alarm[3] = -1;
                alarm[4] = -1;
                
                //Stop Charging Sound
                if (audio_is_playing(snd_charging_level1_SFX))
                {
                    audio_stop_sound(snd_charging_level1_SFX);
                }
                if (audio_is_playing(snd_charging_level2_SFX))
                {
                    audio_stop_sound(snd_charging_level2_SFX);
                }
                 
            
                //I-Frames and knockback
                invincibility_time = 60;
                knockback_time = 10;
                knock_force = 4;
                damage_hitstop = true;
                show_debug_message("Hit by projectile.");
                
                //Extend hitstop time if hp is 0
                if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
                state = states.hitstop;
               }
            else
               {
                show_debug_message("Hit by projectile during DRIVE.");
                hitstop = false;
                damage_hitstop = false;
                if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
                old_state = state;
                state = states.hitstop;
               }
               
            //Play hurt sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
                }
            }   
            
           }
        projectile_meeting.state = proj_state.destroyed;
       }
           
   }
else if (place_meeting(x, y, obj_projectile) && (iframes == true || siframes == true || invincibility_active == true))
   {
    //A little bit of hitstop for sliding by projectile 
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck = false)
       {
        hitstop = false;
        damage_hitstop = false;
        alarm[11] = room_speed * (3/60);
        old_state = state;
        state = states.hitstop;
       }
   }

//Hit by melee attack   
if (place_meeting(x, y, obj_enemy_melee) && iframes = false && siframes = false && invincibility_active == false)
   {   
    if (!collision_line(x,y,obj_enemy_melee.enemy_parent.x,obj_enemy_melee.enemy_parent.y,obj_boundary,false,true) && !collision_line(x,y,obj_enemy_melee.enemy_parent.x,obj_enemy_melee.enemy_parent.y,obj_bunt_bat,false,true))
       {
        melee_meeting = instance_place(x,y, obj_enemy_melee);
        if (melee_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 16;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            //Cancel Existing Properties
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            
            //Stop Charging Sound
            if (audio_is_playing(snd_charging_level1_SFX))
            {
                audio_stop_sound(snd_charging_level1_SFX);
            }
            if (audio_is_playing(snd_charging_level2_SFX))
            {
                audio_stop_sound(snd_charging_level2_SFX);
            }
            
            //I-Frames and knockback
            invincibility_time = 90;
            knockback_time = 25;
            knock_force = 6;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
                   
            //Enemy Hitstop
            melee_meeting.enemy_parent.damage_hitstop = false;
            melee_meeting.enemy_parent.alarm[9] = alarm[11];
            melee_meeting.enemy_parent.old_state = melee_meeting.enemy_parent.state;
            melee_meeting.enemy_parent.state = e_state.hitstop;
            //show_debug_message("enemy that hit me is " + string(melee_meeting.enemy_parent) + " state is " + string(melee_meeting.enemy_parent.state));
            melee_meeting.alarm[0] = 1;       
            state = states.hitstop;
            
            //Play hurt sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
                }
            }           
           }
        melee_meeting.alarm[0] = 1;
       }
   }
   
//Hit by enemy ball n chain
if (place_meeting(x,y,obj_enemy_ball_hitbox) && iframes == false && siframes == false && invincibility_active == false)
{
    if (!collision_line(x,y,obj_enemy_ball_hitbox.x,obj_enemy_ball_hitbox.y,obj_boundary,false,true) && !collision_line(x,y,obj_enemy_ball_hitbox.x,obj_enemy_ball_hitbox.y,obj_bunt_bat,false,true))
    {
        ball_meeting = instance_place(x,y, obj_enemy_ball_hitbox)
        if (ball_meeting.state != ball_n_chain_state.reversed)
        {
            if (ball_meeting.x > x)
            {
                hitdir = -1;
            } 
            else
            {
                hitdir = 1;
            }
            hp -= 16;
            scr_score_tracker_script_strike();
            if (iframes == false)
            {
                //Cancel Existing Properties
                crouching = false;
                charging = false;
                chargeOne = false;
                chargeTwo = false;
                alarm[3] = -1;
                alarm[4] = -1;
                
                //Stop Charging Sound
                if (audio_is_playing(snd_charging_level1_SFX))
                {
                    audio_stop_sound(snd_charging_level1_SFX);
                }
                if (audio_is_playing(snd_charging_level2_SFX))
                {
                    audio_stop_sound(snd_charging_level2_SFX);
                } 
            
                //I-Frames and knockback
                invincibility_time = 90;
                knockback_time = 25;
                knock_force = 6;
                damage_hitstop = true;
                show_debug_message("Hit by Ball n Chain");
                if (hp < 1)
                {
                    alarm[11] = room_speed * (40/60);
                }
                else
                {
                    alarm[11] = room_speed * (3/60);
                }
            
                //Ball N Chain Hitstop
                ball_meeting.damage_hitstop = false;
                ball_meeting.alarm[3] = alarm[11];
                ball_meeting.old_state = ball_meeting.state;
                ball_meeting.state = ball_n_chain_state.hitstop;
            
                state = states.hitstop;
                
                //Play hurt sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
                    }
                } 
            }
        }
    }    
}
   
//Hit by explosion
if (place_meeting(x,y,obj_explosion_hitbox) && iframes = false && siframes = false && invincibility_active == false)
{
    if (!collision_line(x,y,obj_explosion_hitbox.x,obj_explosion_hitbox.y,obj_boundary,false,true))
    {
        explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        if (explosion_meeting.x > x)
        {
            hitdir = -1;
        } 
        else
        {
            hitdir = 1;
        }
        hp -= 20;
        scr_score_tracker_script_strike();
        if (iframes == false)
        {
            show_debug_message("Player hit by explosion.");
            //Cancel Existing Properties
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            
            //Stop Charging Sound
            if (audio_is_playing(snd_charging_level1_SFX))
            {
                audio_stop_sound(snd_charging_level1_SFX);
            }
            if (audio_is_playing(snd_charging_level2_SFX))
            {
                audio_stop_sound(snd_charging_level2_SFX);
            } 
            
            //I-Frames and Knockback
            invincibility_time = 100;
            knockback_time = 30;
            knock_force = 8;
            damage_hitstop = true;
            if (hp < 1)
            {
                alarm[11] = room_speed * (40/60);
            }
            else
            {
                alarm[11] = room_speed * (3/60);
            }
      
            state = states.hitstop;    
            
            //Play hurt sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
                }
            }      
        }
    }
}

//Hit by environment or other neutral damage
if (place_meeting(x,y,obj_spike_floor) && iframes = false && siframes = false && invincibility_active == false)
{
    //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
    hitdir = 0;
    hp -= 19;
    scr_score_tracker_script_strike();
    if (iframes == false)
    {
        //Cancel Existing Properties
        crouching = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        
        //Stop Charging Sound
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_stop_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_stop_sound(snd_charging_level2_SFX);
        } 
        
        //Invincibility
        invincibility_time = 100;
        knockback_time = 24;
        knock_force = 8;
        damage_hitstop = true;
        if (hp < 1)
        {
            alarm[11] = room_speed * (40/60);
        }
        else
        {
            alarm[11] = room_speed * (3/60);
        }

        //explosion_meeting.alarm[0] = 1;
  
        state = states.hitstop;
        
        //Play hurt sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
            }
        }          
    }
}
if (place_meeting(x,y,obj_spike_wall_L) && iframes = false && siframes = false && invincibility_active == false)
{
    //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
    hitdir = 1;
    hp -= 19;
    scr_score_tracker_script_strike();
    if (iframes == false)
    {
        //Cancel Existing Properties
        crouching = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        
        //Stop Charging Sound
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_stop_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_stop_sound(snd_charging_level2_SFX);
        } 
        
        //Invincibility
        invincibility_time = 100;
        knockback_time = 22;
        knock_force = 6;
        damage_hitstop = true;
        if (hp < 1)
        {
            alarm[11] = room_speed * (40/60);
        }
        else
        {
            alarm[11] = room_speed * (3/60);
        }

        //explosion_meeting.alarm[0] = 1;
  
        state = states.hitstop;         
    }
}
if (place_meeting(x,y,obj_spike_wall_R) && iframes = false && siframes = false && invincibility_active == false)
{
    //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
    hitdir = -1;
    hp -= 19;
    scr_score_tracker_script_strike();
    if (iframes == false)
    {
        //Cancel Existing States
        crouching = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        
        //Stop Charging Sound
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_stop_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_stop_sound(snd_charging_level2_SFX);
        } 
        
        //I-Frames and Knockback
        invincibility_time = 100;
        knockback_time = 22;
        knock_force = 6;
        damage_hitstop = true;
        if (hp < 1)
        {
            alarm[11] = room_speed * (40/60);
        }
        else
        {
            alarm[11] = room_speed * (3/60);
        }

        //explosion_meeting.alarm[0] = 1;
  
        state = states.hitstop;
            
        //Play hurt sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
            }
        }          
    }
}
if (place_meeting(x,y,obj_spike_ceiling) && iframes = false && siframes = false && invincibility_active == false)
{
    //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
    hitdir = 0;
    hp -= 19;
    scr_score_tracker_script_strike();
    if (iframes == false)
    {
        //Cancel Existing Properties
        crouching = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        
        //Stop Charging Sound
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_stop_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_stop_sound(snd_charging_level2_SFX);
        } 
        
        //Invincibility
        invincibility_time = 100;
        knockback_time = 24;
        knock_force = 6;
        damage_hitstop = true;
        if (hp < 1)
        {
            alarm[11] = room_speed * (40/60);
        }
        else
        {
            alarm[11] = room_speed * (3/60);
        }

        //explosion_meeting.alarm[0] = 1;
  
        state = states.hitstop;         
        
        //Play hurt sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_damage_taken_SFX,other,false);    
            }
        } 
    }
}              
