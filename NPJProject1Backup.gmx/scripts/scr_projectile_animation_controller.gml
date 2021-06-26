if (state == proj_state.normal)
{
    sprite_index = spr_projectile;
    image_speed = 0.2;
}
else if (state == proj_state.struck)
{
    sprite_index = spr_projectile_returned;
    image_speed = 0.2;
}

if (state == proj_state.hitstop)
{
    image_speed = 0;
}
else
{
    image_speed = 0.2;
}
