///Choose sprite and image speed based on state
if (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_enemy))
{
    if (state == e_state.chase)
    {
        if (hspd != 0)
        {
            sprite_index = move_sprite;
            image_speed = 0.2;   
        }
        else
        {
            sprite_index = idle_sprite;
            image_speed = 0.2;
        }
    }
    else if (state == e_state.idle)
    {
        sprite_index = idle_sprite;
        image_speed = 0.2;
    }
}

if (state == e_state.hitstop)
{
    image_speed = 0;
}
else
{
    if (state == e_state.idle)
    {
        image_speed = 0.2;
    }
    if (state == e_state.chase)
    {
        image_speed = 0.2;
    }
}
