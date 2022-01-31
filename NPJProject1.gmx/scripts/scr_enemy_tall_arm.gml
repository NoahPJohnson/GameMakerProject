if (enemy_parent != noone)
{
    if (enemy_parent.state == e_state.crash)
    {
        instance_destroy(self);
    }
    if (instance_exists(enemy_parent.shield))
    {
        if (enemy_parent.firing == true && animation_loop == true)
        {
            animation_loop = false;
            image_speed = 0.4;
            sprite_index = firing_sprite;
        }
        else if (enemy_parent.firing == false)
        {
            animation_loop = true;
            image_speed = 0.2;
            sprite_index = normal_sprite;
        }
        if (enemy_parent.shield.sprite_index == enemy_parent.shield.shield_left_sprite)
        {
            //sprite_index = spr_enemy_shield_L;
            if (abs(90-image_angle) > 0)
            {
                image_angle += room_speed * ((abs(90-image_angle)/12)/60);
                if (y > enemy_parent.y-48)
                {
                    y -= room_speed * ((2)/60);
                }
                else
                {
                    y = enemy_parent.y-48;
                }
            }
        }
        else if (enemy_parent.shield.sprite_index == enemy_parent.shield.shield_up_sprite)
        {
            //sprite_index = spr_enemy_shield_Up;
            if (abs(0-image_angle) > 0)
            {
                if (image_angle < 0)
                {
                    image_angle += room_speed * ((abs(0-image_angle)/12)/60);
                }
                else
                {
                    image_angle -= room_speed * ((abs(0-image_angle)/12)/60);
                }
                if (y < enemy_parent.y-32)
                {
                    y += room_speed * ((2)/60);
                }
                else
                {
                    y = enemy_parent.y-32;
                }
            }
        }
        else if (enemy_parent.shield.sprite_index == enemy_parent.shield.shield_right_sprite)
        {
            //sprite_index = spr_enemy_shield_R;
            if (abs(-90-image_angle) > 0)
            {
                image_angle -= room_speed * ((abs(-90-image_angle)/12)/60);
                if (y > enemy_parent.y-48)
                {
                    y -= room_speed * ((2)/60);
                }
                else
                {
                    y = enemy_parent.y-48;
                }
            }
        }
        x = enemy_parent.x;
    }
    else
    {
        animation_loop = true;
        image_speed = 0.2;
        image_angle = 0;
        image_xscale = enemy_parent.image_xscale;
        sprite_index = back_sprite;
        x = enemy_parent.x;
        y = enemy_parent.y-48;
        if (enemy_parent.state == e_state.hitstun)
        {
            image_speed = 0;
        }
    }
}
else
{
    instance_destroy(self);
}
