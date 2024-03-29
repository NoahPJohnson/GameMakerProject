///Swing the Bat
//Input for direction
key_R = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0.2);
key_L = -(keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < -0.2));
key_Swing_Held = keyboard_check(vk_numpad2) || keyboard_check(vk_shift) || keyboard_check(vk_enter) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4);
key_Swing_Pressed = keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face3) gamepad_button_check_pressed(0, gp_face4);
key_Swing_Released = keyboard_check_released(vk_numpad2) || keyboard_check_released(vk_shift) || keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face3) || gamepad_button_check_released(0, gp_face4);

//key_J = keyboard_check_pressed(vk_space);
//key_J_held = keyboard_check(vk_space);

mve = key_L + key_R;

//Powerup
if (constant_charge_active == true)
   {
    chargeTwo = true;
   }
//Direction      
if (mve = 1)
   {
    right = true;
    image_xscale = 1;
   }

if (mve = -1)
   {
    right = false;
    image_xscale = -1;
   }

if (!place_meeting(x,y+1,obj_boundary) && !place_meeting(x,y+1,obj_enemy))
   {
    //show_debug_message("Off ground and swinging, go back to normal.");
    recovery = false;
    mspd = mspd_normal;
    jspd = jump;
    charging = false;
    chargeOne = false;
    chargeTwo = false;
    state = states.normal;
   }     
   
//Looking Up
scr_looking_up();

//Hit by Enemy
scr_player_damage();

//Crouching
scr_crouching();

//Collide with Enemy
scr_playerCollisionWithEnemy();

//Collision
scr_collision();


if (charging == true)
   {
    if (key_Swing_Released || !key_Swing_Held)
       {
        if (swinging == false)   
           { 
            charging = false;     
            swinging = true;
            if (up == true)
            {
                up_stored = true;
            }
            if (alarm[0] == -1)
               {
                alarm[0] = room_speed * (8/60);
               }                     
           }
       }
   }
