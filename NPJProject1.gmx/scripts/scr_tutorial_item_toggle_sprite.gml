if (alarm[0] == -1)
{
    if (sprite_index == original_sprite)
    {
        alarm[0] = room_speed * (toggle_wait_time/60);
        sprite_index = toggle_sprite;
    }
    else
    {
        sprite_index = original_sprite;
    }
} 
