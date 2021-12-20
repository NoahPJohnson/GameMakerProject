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
    if (obj_player != noone)
    {
        image_angle = point_direction(x,y,obj_player.x,obj_player.y) + 180;
    }
    image_speed = 0.2;
}
