///Choose sprite and image speed based on state
if (state == e_state.chase)
{
    if (meleeAttack == false)
    {
        if (firing == true)
        {
            if (animation_loop == true)
            {
                image_index = 0;
                sprite_index = fire_sprites[fire_index];
                image_speed = 0.2;
                animation_loop = false;
            }
        }
        else
        {   
            if (hspd != 0)
            {
                sprite_index = move_sprite;
                image_speed = 0.2;
                animation_loop = true;
            }
            else
            {
                sprite_index = idle_sprite;
                image_speed = 0.2;
                animation_loop = true;
            }
        }
    }
    else
    {
        if (alarm[7] == 30)
        {
            instance_create(x,y-16,obj_enemy_melee_flash);
        }
        sprite_index = melee_sprite;
        image_speed = 0.4;
        animation_loop = true;
    }
    if (!place_meeting(x,y+3,obj_boundary))
    {
        sprite_index = air_sprite;
        image_speed = 0.2;
        animation_loop = false;
    }
}
else if (state == e_state.hitstop)
{
    if (damage_hitstop == true)
    {
        sprite_index = damage_sprite;
        animation_loop = false;
    }
}
else if (state == e_state.idle)
{
    sprite_index = idle_sprite;
    image_speed = 0.2;
    animation_loop = true;
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

if (state == e_state.crash)
{
    if (image_angle < 360)
    {
        image_angle += room_speed * ((2*hspeed)/60);
    }
    else
    {
        image_angle = 0;
    }
}
else
{
    image_angle = 0;
}

if (meleeAttack == false && animation_loop == true)
{
    if (dir != 0)
    {
        image_xscale = dir;
    }
}
else if (meleeAttack == true && animation_loop == false)
{
    if (melee_dir != 0)
    {
        image_xscale = melee_dir;
    }
}
else if (firing == true && animation_loop == false)
{
    image_xscale = sign((obj_player.x) - x);
}
