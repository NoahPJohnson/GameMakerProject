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
                sprite_index = fire_sprite;
                image_speed = 0.2
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
                show_debug_message("moving no ATTACK = LOOP");   
            }
            else
            {
                sprite_index = idle_sprite;
                image_speed = 0.2;
                animation_loop = true;
                show_debug_message("no Hspeed = loop");  
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
                sprite_index = anti_air_sprite;
                image_speed = 0.4;
                animation_loop = false;
            }
            if (alarm[7] == anti_air_warning_time)
            {
                instance_create(x,y-16,obj_enemy_melee_flash);
            }
        }
        else if (follow_up_attack)
        {
            if (animation_loop == true)
            {
                image_index = 0;
                sprite_index = follow_up_sprite;
                image_speed = 0.4;
                animation_loop = false;
                show_debug_message("follow up = NO loop");
            }  
            if (alarm[7] == follow_up_warning_time)
            {
                instance_create(x,y-16,obj_enemy_melee_flash);
            }
        }
        else
        {
            if (animation_loop == true)
            {
                image_index = 0;
                sprite_index = melee_sprite;
                image_speed = 0.4;
                animation_loop = false;
            }
            if (alarm[7] == melee_warning_time)
            {
                instance_create(x,y-16,obj_enemy_melee_flash);
            }
        }
    }
    if (!place_meeting(x,y+3,obj_boundary) && follow_up_attack == false)
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
            image_speed = 0.4;
        }
        else
        {
            image_speed = 0.2;
        }
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

if (dir != 0 && meleeAttack == false && animation_loop == true)
{
    image_xscale = dir;
}
