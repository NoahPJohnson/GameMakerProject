if (animation_loop == false)
{
    if (sprite_index == attack_start_sprite)
    {
        image_speed = 0;
        image_index = 5;
        show_debug_message("end the animation");
    }
    else if (sprite_index == attack_end_sprite)
    {
        sprite_index = idle_sprite;
    } 
    else if (sprite_index == fire_sprite)
    {
        sprite_index = idle_sprite;
    }      
}


