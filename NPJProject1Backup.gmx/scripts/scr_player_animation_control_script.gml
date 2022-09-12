//Changes the player's sprites and otherwise affects animation


if (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_enemy))
   {
    if (mve != 0 && swinging == false && recovery == false && sprite_index != spr_player_running)
       {
        sprite_index = spr_player_running;
        image_speed = 0.2;
       }
    if (crouching == true && !instance_exists(obj_bunt_bat) && sliding == false && sprite_index != spr_player_crouching)
       {
        sprite_index = spr_player_crouching_idle;
       }
    if (crouching == true && instance_exists(obj_bunt_bat) && sliding == false && sprite_index != spr_player_bunting)
       {
        sprite_index = spr_player_bunting;
        image_speed = 0.2;
       }
    if (sliding == true && siframes == true && sprite_index != spr_player_crouching)
       {
        sprite_index = spr_player_sliding;
        image_speed = 0.2;
       }
    if (sliding == true && siframes == false && sprite_index != spr_player_crouching2)
       {
        sprite_index = spr_player_sliding;
        image_speed = 0.2;
       }
    if (up == true && crouching == false && charging == false && swinging == false && recovery == false && sprite_index != spr_player_up)
       {
        sprite_index = spr_player_idle_up;
        image_speed = 0.2;
       }
    if (mve != 0 && up == true && swinging == false && recovery == false && sprite_index != spr_player_running_up)
       {
        sprite_index = spr_player_running_up;
        image_speed = 0.2;
       }
    if ((swinging == true || recovery == true) && up == false && sprite_index != spr_player_swinging)
       {
        sprite_index = spr_player_swinging;
        image_index = 0;
        image_speed = 0.5;
       }
    if ((swinging == true || recovery == true) && up == true && sprite_index != spr_player_swing_launcher)
       {
        sprite_index = spr_player_swing_launcher;
        image_index = 0;
        image_speed = 0.5;
        //show_debug_message("Play Launcher Animation!");
       }
    if (charging == true && chargeOne == false && chargeTwo == false && drive == true && dashing == true && sprite_index != spr_player_charge_dash)
       {
        sprite_index = spr_player_charge_dash;
        image_speed = 0.3;
       }
    if (charging == true && chargeOne == true && drive == true && dashing == true && sprite_index != spr_player_charge_dash_Level_One)
       {
        sprite_index = spr_player_charge_dash_Level_One;
        image_speed = 0.3;
       }
    if (charging == true && chargeTwo == true && drive == true && dashing == true && sprite_index != spr_player_charge_dash_Level_Two)
       {
        sprite_index = spr_player_charge_dash_Level_Two;
        image_speed = 0.3;
       }
    if (charging == true && chargeOne == false && chargeTwo == false && dashing == false && up == true && sprite_index != spr_player_up_charging)
       {
        sprite_index = spr_player_charge_up;
        image_speed = 0.2;
       }
    if (charging == true && chargeOne == true && dashing == false && up == true && sprite_index != spr_player_up_charged1)
       {
        sprite_index = spr_player_charge_up_Level_One;
        image_speed = 0.2;
        //show_debug_message("ANIMATE charge One Up");
       }
    if (charging == true && chargeTwo == true && dashing == false && up == true && sprite_index != spr_player_up_charged2)
       {
        sprite_index = spr_player_charge_up_Level_Two;
        image_speed = 0.2;
        //show_debug_message("Animate charge TWO Up");
       }
    if (charging == true && chargeOne == false && chargeTwo == false && dashing == false && up == false && sprite_index != spr_player_charging)
       {
        sprite_index = spr_player_charge;
        image_speed = 0.2;
       }
    if (charging == true && chargeOne == true && dashing == false && up == false && sprite_index != spr_player_charged1)
       {
        sprite_index = spr_player_charge_Level_One;
        image_speed = 0.2;
       }
    if (charging == true && chargeTwo == true && dashing == false && up == false && sprite_index != spr_player_charged2)
       {
        sprite_index = spr_player_charge_Level_Two;
        image_speed = 0.2;
       }
    if (mve == 0 && crouching == false && charging == false && swinging == false && recovery == false && up == false && sprite_index != spr_player_idle)
       {
        sprite_index = spr_player_idle_v2;
        image_speed = 0.2;
       }
    if (state == states.powerslide && sprite_index != spr_player_sliding)
       {
        sprite_index = spr_player_sliding;
       }
   }
else
   {
    if (swinging == false && recovery == false && sprite_index != spr_player_jumping)
       {
        sprite_index = spr_player_jumping;
        image_speed = 0.2;
       }
    if ((swinging == true || recovery == true) && sprite_index != spr_player_spike)
       {
        sprite_index = spr_player_spike;
        image_index = 0;
        image_speed = 0.5;
       }
   }

if (state == states.hitstop)
   {
    image_speed = 0;
   }
else
   {
    if (sprite_index == spr_player_swinging)
       {
        image_speed = 0.5;
       }
    else if (sprite_index == spr_player_swing_launcher)
       {
        image_speed = 0.5;
       }
    else if (sprite_index == spr_player_spike)
       {
        image_speed = 0.5;
       }
    else if (sprite_index == spr_player_charge)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_charge_Level_One)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_charge_Level_Two)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_charge_up || sprite_index == spr_player_charge_up_Level_One || sprite_index == spr_player_charge_up_Level_Two)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_charge_dash || sprite_index == spr_player_charge_dash_Level_One || sprite_index == spr_player_charge_dash_Level_Two)
       {
        image_speed = 0.3;
       }
    else if (sprite_index == spr_player_bunting)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_running)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_idle_v2)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_idle_up)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_running_up)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_crouching_idle)
       {
        image_speed = 0.2;
       }
    else if (sprite_index == spr_player_sliding)
       {
        image_speed = 0.2;
       }
   }
   

