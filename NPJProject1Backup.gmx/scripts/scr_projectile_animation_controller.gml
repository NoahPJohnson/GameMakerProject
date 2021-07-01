if (state == proj_state.normal)
{
    sprite_index = projectile_normal_sprite;
    image_speed = 0.2;
}
else if (state == proj_state.struck)
{
    sprite_index = projectile_returned_sprite;
    image_speed = 0.2;
}

if (update_angle == true)
{
    image_angle = direction;
}

if (alarm[2] < 40 && alarm[2] > -1)
{
    if (state == proj_state.normal)
    {
        sprite_index = projectile_short_fuse_sprite;
        image_speed = 0.2;
    }
    else if (state == proj_state.struck)
    {
        sprite_index = projectile_short_fuse_returned_sprite;
        image_speed = 0.2;
    }
}

if (state == proj_state.hitstop)
{
    image_speed = 0;
}
else
{
    image_speed = 0.2;
}
