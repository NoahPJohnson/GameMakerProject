if (animation_loop == false)
{
    if (sprite_index == melee_sprites[0] || sprite_index == melee_sprites[1] || sprite_index == melee_sprites[2])
    {
        sprite_index = idle_sprite;
    }
    else if (sprite_index == fire_sprite)
    {
        sprite_index = idle_sprite;
    }      
}


