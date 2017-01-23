///Dashing
key_D = keyboard_check(vk_numpad1)
key_D_pressed = keyboard_check_pressed(vk_numpad1)
key_D_released = keyboard_check_released(vk_numpad1)
if (place_meeting(x, y+1, obj_boundary))
   {
    if (key_D_pressed)
       {
        hspd = mve * 2;    
       }

    if (key_D)
       {
        dashing = true;
       }
   }

if (dashing = true)
   {
    if (key_D_released)
       {
        dashing = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1; 
        mspd = 8;
        dash = 1;
        sprite_index = spr_player;
       }
   }         

if (crouching = false && sliding = false && dashing = true)
   {
    if (key_R && !(-key_L) && sp > 3)
       {
        if (hspd < 16)
           {
            hspd += dash;
            sp -= 2;
           }
       }
    else if (-key_L && !key_R && sp > 3)
       {
        if (hspd > -16)
           {
            hspd -= dash;
            sp -= 2;
           }
       }
    else
       {
        dash = 1;
        if (hspd > .2)
           {
            hspd -= dash;
           }
        else if (hspd < -.2)
           {
            hspd += dash;
           }
        else 
           {
            hspd = 0;
            dash = 1;
           }
       }
    if (sp < 3)
       {
        hspd = hspd / 2;
       }    
   }

if (dashing = true)   
   {
    if (abs(hspd) > 15 && iframes = false && sp > 3 && place_meeting(x, y+1, obj_boundary))
       {
        if (charging = false)
           {
            sprite_index = spr_player_charging;
           }
        drive = true;
        sp -= 2.3;
        if (alarm[3] = -1 && charging = false)
           {
            charging = true;
            alarm[3] = 16;
           }
       }      
    else
       {  
        drive = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        if (iframes = false)
           {
            sprite_index = spr_player;
           }
       }       
   }     
      
   
if (drive = true && place_meeting(x, y+1, obj_boundary))
   {
    if (key_C && sp > 33)
       {
        sp -= 33;
        state = states.powerslide
       }
   }

   
                        
