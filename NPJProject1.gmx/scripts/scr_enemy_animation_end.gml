if (animation_loop == false)
{
    if (sprite_index == melee_sprite)
    {
        sprite_index = idle_sprite;
    }
    else if (sprite_index == anti_air_sprite)
    {
        sprite_index = idle_sprite;
    }
    else if (sprite_index == follow_up_sprite)
    {
        sprite_index = idle_sprite;
    }
    else if (sprite_index == fire_sprite)
    {
        sprite_index = idle_sprite;
    }      
}


