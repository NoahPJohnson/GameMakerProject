///Choose sprite and image speed based on state
if (state == e_state.chase)
{
    if (meleeAttack == false)
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
    else
    {
        if (antiAir)
        {
            if (animation_loop == true)
            {
                image_index = 0;
                if (alarm[7] == 6)
                {
                    instance_create(x,y-16,obj_enemy_melee_flash);
                }
                sprite_index = anti_air_sprite;
                image_speed = 0.4;
                animation_loop = false;
            }
        }
        else
        {
            if (animation_loop == true)
            {
                image_index = 0;
                if (alarm[7] == 30)
                {
                    instance_create(x,y-16,obj_enemy_melee_flash);
                }
                sprite_index = melee_sprites[melee_index];
                image_speed = 0.3;
                animation_loop = false;
            }
        }
    }
    if (!place_meeting(x,y+3,obj_boundary))
    {
        sprite_index = air_sprite;
        image_speed = 0.2;
        animation_loop = false;
    }
    
}
else if (state == e_state.hitstun)
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
else if (state == e_state.crash)
{
    sprite_index = crash_sprite;
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
        if (antiAir)
        {
            image_speed = 0.4;
        }
        else if (follow_up_attack)
        {
            image_speed = 0.4;
        }
        else if (meleeAttack)
        {
            image_speed = 0.3;
        }
        else
        {
            image_speed = 0.2;
        }
    }
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
if (firing == true && animation_loop == false)
{
    image_xscale = sign((obj_player.x) - x);
}
