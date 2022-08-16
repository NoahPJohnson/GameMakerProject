///Crouching

key_C = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.60 && stick_moved_down == false);
stick_moved_down = key_C;
key_C_held = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.60);
key_C_released = keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) <= 0.60 && stick_moved_down == true);

if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && recovery = false && drive = false)
   {
    if (key_C_held && sliding == false)
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
        
        //Stop Charging Sound
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_stop_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_stop_sound(snd_charging_level2_SFX);
        }
        
        //sprite_index = spr_player_crouching;  
        if (state != states.normal && state != states.hitstop && state != states.knockback)
           {
            state = states.normal
           }
       } 
   }   
else
   {
    crouching = false;
    sliding = false;
    if (swinging == false && recovery == false)
       {
        mspd = mspd_normal;
       }
   } 

if ((key_C_released || !key_C_held) && !place_meeting(x,y-30,obj_boundary) && (!place_meeting(x,y-30,obj_enemy) || place_meeting(x,y,obj_enemy)) && crouching == true)
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
    //sprite_index = spr_player;
   }    
