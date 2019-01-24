///Looking Up /The Launcher
key_U = keyboard_check_pressed(ord("W"))
key_U_held = keyboard_check(ord("W"))
key_U_released = keyboard_check_released(ord("W"))

if (place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy))
   {
    if (swinging == false && recovery == false && crouching == false && up == false)
       { 
        if (key_U_held)
           {
            up = true;
            crouching = false;
            mspd = mspd_normal;
            if (charging = true)
               {
                //sprite_index = spr_player_up_charging;
                mspd = 0;
               }
            if (chargeOne = true)
               {
                //sprite_index = spr_player_up_charged1;
                mspd = 0;
               }
            if (chargeTwo = true)
               {
                //sprite_index = spr_player_up_charged2;
                mspd = 0;
               }
            else
               {
                //sprite_index = spr_player_up;
               }
           }
       }
   }
else
   {
    up = false;
    if (recovery == false && iframes == false && crouching == false)
       {
        //sprite_index = spr_player;
       }
   }
if (swinging = false && key_U_released)
   {
    up = false;
    if (charging = true)
       {
        //sprite_index = spr_player_charging;
       }
    if (chargeOne = true)
       {
        //sprite_index = spr_player_charged1;
       }
    if (chargeTwo = true)
       {
        //sprite_index = spr_player_charged2;
       }
    if (charging == false && chargeOne == false && chargeTwo == false && crouching == false)
       {   
        //sprite_index = spr_player;    
       }
   }   
