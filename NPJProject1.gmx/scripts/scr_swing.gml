///Swing the Bat
//Input for direction
key_R = keyboard_check(ord("D"));
key_L = -keyboard_check(ord("A"));
key_Swing_Held = keyboard_check(vk_numpad2) || keyboard_check(vk_shift);
key_Swing_Pressed = keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift);
key_Swing_Released = keyboard_check_released(vk_numpad2) || keyboard_check_released(vk_shift);

//key_J = keyboard_check_pressed(vk_space);
//key_J_held = keyboard_check(vk_space);

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

if (!place_meeting(x,y+1,obj_boundary) && !place_meeting(x,y+1,obj_enemy))
   {
    recovery = false;
    mspd = mspd_normal;
    jspd = jump;
    charging = false;
    chargeOne = false;
    chargeTwo = false;
    state = states.normal;
   }   

   
//Jumping
/*if (crouching == false)
   {
    if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && !place_meeting(x, y, obj_enemy))
       {
        vspd = key_J * -jspd;
        jumping = true;
       }     

    if (vspd < 0 && !key_J_held)
       {
        vspd = max(vspd,-jspd/4);
       }   
   }
if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && key_J = false)
   {
    jumping = false;
   }*/   
   
//Dash?
//scr_dash();
   
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


if (charging == true)
   {
    if (key_Swing_Released || !key_Swing_Held)
       {
        if (swinging == false)   
           { 
            charging = false;     
            swinging = true;
            if (alarm[0] == -1)
               {
                //mspd = 0;
                //hspd = 0;
                //jspd = 0;
                alarm[0] = room_speed * (8/60);
               }                     
           }
       }
   } 
