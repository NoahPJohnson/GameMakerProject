///Animation control script for the first boss's head
if (vulnerable != previously_vulnerable)
{
    if (vulnerable == true && animation_loop == true)
    {
        sprite_index = spr_boss_weakpoint_unmasking;
        image_speed = 0.2;
        animation_loop = false;
    }
    else if (vulnerable == false && animation_loop == true)
    {
        sprite_index = spr_boss_weakpoint_remasking;
        image_speed = 0.2;
        animation_loop = false;
    }
    previously_vulnerable = vulnerable;
}
if (hitstop == true)
{
    image_speed = 0;
}
else
{
    if (obj_player != noone && state != boss_state.hitstun && state != boss_state.hitstop && state != boss_state.crash)
    {
        draw_image_angle = point_direction(x,y,obj_player.x,obj_player.y) + 180;
    }
    else if (state == boss_state.crash)
    {
        if (draw_image_angle < 360)
        {
            draw_image_angle += room_speed * ((2*hspeed)/60);
        }
        else
        {
            draw_image_angle = 0;
        }
    }
    image_speed = 0.2;
}
