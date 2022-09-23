if (throwing == true && enemy_parent.shot_timer < 52 && sprite_index != spr_boss_enemy1_right_arm_throw)
{
    image_index = 0;
    sprite_index = spr_boss_enemy1_right_arm_throw;
    image_speed = 0.2;
}
if (enemy_parent.state == boss_state.hitstun)
{
    if (sprite_index != spr_boss_enemy1_right_arm_hit)
    {
        sprite_index = spr_boss_enemy1_right_arm_hit;
        image_speed = 0.2;
    }
}
else 
{
    if (throwing == false) 
    {
        sprite_index = spr_boss_enemy1_right_arm;
        image_speed = 0.15;
    }
}
