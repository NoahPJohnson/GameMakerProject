///Swing the Bat
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
                alarm[0] = 6;
               }                     
           }
       }
   } 
