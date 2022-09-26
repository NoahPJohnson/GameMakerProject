if (door_active == false)
{
    if (room_transition_timer > 0)
    {
        room_transition_timer -= room_speed * (1/60);
    }
    else
    {
        room_goto(room_to_enter);
    }
}

if (place_meeting(x,y,obj_player) && door_active == true)
{
    obj_checkpoint_manager.checkpoint_active = false;
    door_active = false;
    saved_player_hp = obj_player.hp;
    saved_player_points = obj_scoring_manager.runs;
    room_transition_timer = room_speed * (room_transition_wait/60);
    if (view_xview[0]+210 > x)
    {
        instance_create(view_xview[0]+220,view_yview[0]+(view_hview[0]/2),obj_level_transition_to);
    }
    else if (view_xview[0]+view_wview[0]-210 < x)
    {
        instance_create(view_xview[0]+view_wview[0]-220,view_yview[0]+(view_hview[0]/2),obj_level_transition_to);
    }
    else
    {
        instance_create(x,view_yview[0]+(view_hview[0]/2),obj_level_transition_to);
    }
    
    //Player Hitstop
    obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = room_transition_timer;
    obj_player.old_state = states.normal;
    obj_player.state = states.hitstop;
    //room_goto(room_to_enter);
    //show_debug_message("Go to the room.")
}
