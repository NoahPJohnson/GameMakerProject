if (!place_meeting(x, y, obj_enemy) && place_meeting(x,y-32,obj_boundary))
{
    if (obj_player.state != states.knockback)
    {
        if (obj_player.alarm[8] == -1)
        {
            obj_player.alarm[8] = room_speed * (18/60);
        }
        //obj_player.wallBounce = true;
        obj_player.hitdir = -1;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_hit_wall_or_armor_SFX,other,false);    
            }
        }
    }
}
