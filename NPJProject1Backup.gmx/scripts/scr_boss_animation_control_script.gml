///Animation control script for the first boss
if (hspd == 0)
{
    sprite_index = spr_boss_enemy1;
    image_speed = 0.2;
}
else if (hspd < 0)
{
    sprite_index = spr_boss_enemy1_advancing;
    image_speed = 0.2;
}
else if (hspd > 0)
{
    sprite_index = spr_boss_enemy1_retreating;
    image_speed = 0.2;
}
