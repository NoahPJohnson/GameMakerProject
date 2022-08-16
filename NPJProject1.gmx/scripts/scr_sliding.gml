key_C = keyboard_check_pressed(ord("S"))
key_C_held = keyboard_check(ord("S"))
key_C_released = keyboard_check_released(ord("S"))
          
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
        if (!place_meeting(x,y-30,obj_boundary) && (!place_meeting(x,y-30,obj_enemy) || place_meeting(x,y,obj_enemy)))
           {
            mspd = 8;
            crouching = false;
            //sprite_index = spr_player;
           }
       }
    state = states.normal
   }

//Hit by Enemy
scr_player_damage();
      
//Stamina
scr_stamina();

//Gravity
if (vspd < 10) 
   {
    vspd += grv;
   }

//Collision
scr_collision();   

   
