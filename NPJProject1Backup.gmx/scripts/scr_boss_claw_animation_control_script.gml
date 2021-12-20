///Animation control script for the first boss's claw
if (special_HP > 1)
{
    if (pulling == false && enemy_parent.player_caught == false)
    {
        sprite_index = spr_boss_enemy_claw_idle;
        image_speed = 0.2;
    }
    if (pulling == true)
    {
        sprite_index = spr_boss_enemy_claw_pulling;
        image_speed = 0.2;
    }
    if (enemy_parent.player_caught == true)
    {
        sprite_index = spr_boss_enemy_claw_grabbing;
        image_speed = 0.4;
    }
}
else if (special_HP > 0)
{
    if (pulling == false && enemy_parent.player_caught == false)
    {
        sprite_index = spr_boss_enemy_claw_idle_fractured;
        image_speed = 0.2;
    }
    if (pulling == true)
    {
        sprite_index = spr_boss_enemy_claw_pulling_fractured;
        image_speed = 0.2;
    }
    if (enemy_parent.player_caught == true)
    {
        sprite_index = spr_boss_enemy_claw_grabbing_fractured;
        image_speed = 0.4;
    }
}
else 
{
    sprite_index = spr_boss_enemy_claw_broken;
    image_speed = 0.2;
}


