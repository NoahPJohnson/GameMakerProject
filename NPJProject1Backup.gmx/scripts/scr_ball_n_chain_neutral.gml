///Neutral state
//swing around
struck = false;
alarm[1] = -1;
alarm[2] = -1;
stop = false;
if (enemy_parent != noone)
{
    origin_offset_x = 0;
    origin_offset_y = -16;
    spin += room_speed * (0.1/60);
    x = enemy_parent.x + (48*sin(spin));
    y = enemy_parent.y-100;
    spin_difference = sign(x-enemy_parent.x);
    if (spin_difference != old_spin_difference)
    {
        //Play swing sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
            }
        }
        old_spin_difference = spin_difference;
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
}

scr_ball_n_chain_links();
   
scr_ball_hit_by_bat();
