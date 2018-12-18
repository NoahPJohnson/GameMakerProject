//Changes the player's sprites and otherwise affects animation
if (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_enemy))
   {
    if (mve != 0 && sprite_index != spr_player_running)
       {
        sprite_index = spr_player_running;
        image_speed = 0.2;
       }
    if (crouching == true && sliding == false && sprite_index != spr_player_crouching)
       {
        sprite_index = spr_player_crouching;
       }
    if (sliding == true && siframes == true && sprite_index != spr_player_crouching)
       {
        sprite_index = spr_player_crouching;
       }
    if (sliding == true && siframes == false && sprite_index != spr_player_crouching2)
       {
        sprite_index = spr_player_crouching2;
       }
    if (up == true && sprite_index != spr_player_up)
       {
        sprite_index = spr_player_up;
       }
    if (charging == true && chargeOne == false && chargeTwo == true && up == true && sprite_index != spr_player_up_charging)
       {
        sprite_index = spr_player_up_charging;
       }
    if (chargeOne == true && up == true && sprite_index != spr_player_up_charged1)
       {
        sprite_index = spr_player_up_charged1;
       }
    if (chargeTwo == true && up == true && sprite_index != spr_player_up_charged2)
       {
        sprite_index = spr_player_up_charged2;
       }
    if (charging == true && chargeOne == false && chargeTwo == true && up == false && sprite_index != spr_player_charging)
       {
        sprite_index = spr_player_charging;
       }
    if (chargeOne == true && up == false && sprite_index != spr_player_charged1)
       {
        sprite_index = spr_player_charged1;
       }
    if (chargeTwo == true && up == false && sprite_index != spr_player_charged2)
       {
        sprite_index = spr_player_charged2;
       }
    if (recovery == true && sprite_index != spr_player_recovery)
       {
        sprite_index = spr_player_recovery;
       }
    if (mve == 0 && crouching == false && charging == false && recovery == false && up == false && sprite_index != spr_player_idle)
       {
        sprite_index = spr_player_idle;
        image_speed = 0.2;
       }
    if (iframes == true && sprite_index != spr_player_iframes)
       {
        sprite_index = spr_player_iframes;
        image_speed = 1;
       }
    if (state == states.knockback && sprite_index != spr_player)
       {
        sprite_index = spr_player;
       }
    if (state == states.powerslide && sprite_index != spr_player_crouching)
       {
        sprite_index = spr_player_crouching;
       }
    if (state == states.hitstop)
       {
        image_speed = 0;
       }
    
   }
else
   {
    sprite_index = spr_player;
    //image_speed = 0.2;
   }
