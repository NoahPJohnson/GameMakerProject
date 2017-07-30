///Swing the Bat
//Input for direction
key_R = keyboard_check(ord("D"));
key_L = -keyboard_check(ord("A"));
mve = key_L + key_R;
//Direction      
if (mve = 1)
   {
    right = true;
   }

if (mve = -1)
   {
    right = false;
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
    if (keyboard_check_released(vk_numpad2))
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
                alarm[0] = room_speed * (6/60);
               }                     
           }
       }
   } 
