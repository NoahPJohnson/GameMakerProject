///Swing the Bat
//Input for direction
key_R = keyboard_check(ord("D"));
key_L = -keyboard_check(ord("A"));
key_Swing_Held = keyboard_check(vk_numpad2) || keyboard_check(vk_shift);
key_Swing_Pressed = keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift);
key_Swing_Released = keyboard_check_released(vk_numpad2) || keyboard_check_released(vk_shift);

mve = key_L + key_R;
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
   
//Looking Up
scr_looking_up();

//Hit by Enemy
scr_player_damage();

//HP = 0
scr_zero_health();

//Crouching
scr_crouching();

//Collide with Enemy
scr_playerCollisionWithEnemy();

//Collision
scr_collision();


if (charging = true)
   {
    if (key_Swing_Released)
       {
        if (swinging = false)   
           { 
            charging = false;     
            swinging = true;
            if (alarm[0] = -1)
               {
                //mspd = 0;
                //hspd = 0;
                //jspd = 0;
                alarm[0] = room_speed * (8/60);
               }                     
           }
       }
   } 
