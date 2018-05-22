///Crouching
key_C = keyboard_check_pressed(ord("S"))
key_C_held = keyboard_check(ord("S"))
key_C_released = keyboard_check_released(ord("S"))

if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && recovery = false && drive = false)
   {
    if (key_C_held && sliding = false)
       {
        crouching = true;
        mspd = 0;
        hspd = 0;
        jspd = 14;
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[3] = -1;
        alarm[4] = -1;
        swinging = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        sprite_index = spr_player_crouching;  
        if (state != states.normal)
           {
            state = states.normal
           }
       } 
   }   
else
   {
    crouching = false;
    sliding = false;
    if (swinging = false && recovery = false)
       {
        mspd = mspd_normal;
       }
   } 

if (key_C_released)
   {
    crouching = false;
    //sliding = false;
    if (charging = false && chargeOne = false && chargeTwo = false && recovery = false)
       { 
        mspd = mspd_normal;
       }
    else
       {
        mspd = 0;
       }   
    sprite_index = spr_player;
   }    
