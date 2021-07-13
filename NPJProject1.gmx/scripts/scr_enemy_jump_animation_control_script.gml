///Choose sprite and image speed based on state
if (state == e_state.chase)
{
    if (meleeAttack == false && jumped == false && place_meeting(x,y+2,obj_boundary))
    {
        if (firing == true)
        {
            sprite_index = fire_sprite;
            image_speed = 0.2
            animation_loop = false;
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
    else if (!place_meeting(x,y+2,obj_boundary))
    {
        if (alarm[7] > -1 && animation_loop == true)
        {
            image_index = 0;
            sprite_index = attack_start_sprite;
            image_speed = 0.4;
            animation_loop = false;
        }
        else if (jumped == true && alarm[7] == -1)
        {
            sprite_index = attack_middle_sprite;
            image_speed = 0.4;
            animation_loop = true;
        }
        else if (jumped == false && alarm[7] == -1 && meleeAttack == false)
        {
            sprite_index = air_sprite;
            image_speed = 0.2;
            animation_loop = true;
        }
    }
    else
    {
        if (jumped == true && animation_loop == true)
        {
            image_index = 0;
            sprite_index = attack_end_sprite;
            image_speed = 0.2;
            animation_loop = false;   
        }
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

if (meleeAttack == false)
{
    if (dir != 0)
    {
        image_xscale = dir;
    }
}
else
{
    if (melee_dir != 0)
    {
        image_xscale = melee_dir;
    }
}


