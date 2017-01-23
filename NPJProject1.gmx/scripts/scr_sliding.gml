key_C = keyboard_check_pressed(ord("S"))
key_C_held = keyboard_check(ord("S"))
key_C_released = keyboard_check_released(ord("S"))

if (abs(hspd) > 0 && !key_J_held && sliding = true)
   {
    if (right = true)
       {
        //hspd = min(hspd,jspd/5);
       }
    else
       {
        //hspd = max(hspd,-jspd/5);
       }
   }
          
if (hspd > 0)
   {        
    hspd = hspd / frc;
   }
   
if (hspd < 0)
   { 
    hspd = hspd / frc;
   }
   
if (abs(hspd) < 1)
   {
    hspd = 0;
    sliding = false;     
    slide2 = false;
    if (key_C_held)
       {
        hspd = 0;
       }
    else
       {
        mspd = 8;
        crouching = false;
        sprite_index = spr_player; 
       }
    state = states.normal
   }

//Hit by Enemy
scr_player_damage();

//HP = 0
scr_zero_health();
      
//Stamina
scr_stamina();

//Gravity
if (vspd < 10) 
   {
    vspd += grv;
   }

//Collision
scr_collision();   

   
