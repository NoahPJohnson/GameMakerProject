///Controls the outline indicating an armored enemies
if (state == e_state.chase && armor_on == false)
{
    armor_on = true;
    instance_create(x,y,armor_outline);
    armor_outline.enemy_parent = self;   
}
if ((state == e_state.hitstun || state == e_state.crash) && armor_on == true)
{
    armor_on = false;
    if (instance_exists(armor_outline) && armor_outline != noone)
    {
        armor_outline.sprite_index = spr_enemy_large_armor_broken;
    }
}

