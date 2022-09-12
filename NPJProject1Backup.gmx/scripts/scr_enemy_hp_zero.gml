///HP = 0
if (hp < 1)
   {
    if (instance_exists(melee_hitbox))
       {   
        melee_hitbox.alarm[0] = 1;
       }
    if (alarm[3] = -1)
       {
        alarm[3] = room_speed * (220/60);
       }
    hitstun = false;
    alarm[1] = -1;
    if (state != e_state.crash)
    {
        //Play broken sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_enemy_broken_SFX,other,false);    
            }
        }
    }
    
    state = e_state.crash
    
    if (fragmenting == true)
    {
        fragment1 = instance_create(x,y-12,obj_enemy_fragment);
        fragment2 = instance_create(x,y+12,obj_enemy_fragment);
        fragment1.crash_display_sprite = fragment1_sprite;
        fragment2.crash_display_sprite = fragment2_sprite;
        fragment1.speed = (abs(old_speed) * hitdir) + (impetus * hitdir) * 0.7;
        fragment2.speed = (abs(old_speed) * hitdir) + (impetus * hitdir) * 0.7;
        fragment1.direction = hitstun_direction-30;
        fragment2.direction = hitstun_direction+30 ;
           
        fragmenting = false;
    }
   }
