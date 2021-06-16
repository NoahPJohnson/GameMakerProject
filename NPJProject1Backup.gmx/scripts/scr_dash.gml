///Dashing
//key_D = keyboard_check(vk_numpad1)
//key_D_pressed = keyboard_check_pressed(vk_numpad1)
//key_D_released = keyboard_check_released(vk_numpad1)
key_R_pressed = keyboard_check_pressed(ord("D"));
key_L_pressed = keyboard_check_pressed(ord("A"));
key_R_released = keyboard_check_released(ord("D"));
key_L_released = keyboard_check_released(ord("A"));

//Initiate with Double Tap
if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && crouching == false)
   {
    //Key pressed while double tap window is open and it is in the same direction
    if ((key_R_pressed || key_L_pressed) && alarm[10] > 0 && directionMemory = right)
       {
        //initiate dash
        doubleTapWindow = false;
        alarm[10] = -1;
        hspd = mve * 2;
        dashing = true;
       }
    //Key pressed while double tap window is not open
    if ((key_R_pressed || key_L_pressed) && doubleTapWindow = false)
       {
        //initiate double tap window
        //directionMemory = right;
        doubleTapWindow = true;
        alarm[10] = room_speed * (10/60);
       }
    //If key is released after window is opened, remember the direction that was released
    if ((key_R_released || key_L_released) && doubleTapWindow = true && alarm[10] > 0)
       {
        directionMemory = right;
        doubleTapWindow = false;
        alarm[10] = room_speed * (15/60);
       }   
    
    /*if (key_D_pressed)
       {
        hspd = mve * 2;    
       }

    if (key_D)
       {
        dashing = true;
       }*/
   }

if (dashing == false && drive == true)
   {
    drive = false;
   }   
   
//Stop by releasing keys
if (dashing == true)
   {
    if (key_R_released || key_L_released || sp < 3)
       {
        doubleTapWindow = false;
        dashing = false;
        drive = false;
        
        
        //test
        if (!key_Swing_Held) 
           {
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            sprite_index = spr_player;
           }
        hspd = 0;
         
        mspd = mspd_normal;
        dash = 1;
        //sprite_index = spr_player;
       }
   }         

if (crouching == false && sliding == false && dashing == true)
   {
    jspd = jump;
    if (key_R && !(-key_L) && sp > 3)
       {
        if (hspd < dash_speed)
           {
            hspd += dash;
            sp -= room_speed * (1/60);
           }
       }
    else if (-key_L && !key_R && sp > 3)
       {
        if (hspd > -dash_speed)
           {
            hspd -= dash;
            sp -= room_speed * (1/60);
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

//Drive (Charge while dashing)
if (dashing == true)   
   {
    if (abs(hspd) > (dash_speed - 1 ) && iframes == false && sp > 3 && place_meeting(x, y+1, obj_boundary))
       {
        if (charging == false)
           {
            sprite_index = spr_player_charging;
           }
        drive = true;
        sp -= room_speed * (1.5/60);
        if (alarm[3] = -1 && charging == false)
           {
            charging = true;
            alarm[3] = room_speed * (16/60);
           }
       }      
    else
       {  
        drive = false;
        /*charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;*/
        if (iframes == false)
           {
            //sprite_index = spr_player;
           }
       }       
   }     
      
//Dash Slide
if (drive == true && place_meeting(x, y+1, obj_boundary))
   {
    if (key_C && sp > 20)
       {
        sp -= 20;
        state = states.powerslide
       }
   }
//Dash Jump
/*if (dashing = true && place_meeting(x, y+1, obj_boundary))
   {
    if (key_J)
       {
        if (dashJump = false)
           {
            dashJump = true;
           }
        //dashJump = true;
        //dashing = false;
        //drive = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
       }
   }*/
if (dashing = true && !place_meeting(x, y+1, obj_boundary) && dashJump = false)
   {
    dashJump = true;
    charging = false;
    chargeOne = false;
    chargeTwo = false;
    alarm[3] = -1;
    alarm[4] = -1;
   }
 
if (dashJump == true)
   {
    //sprite_index = spr_enemy;
    if (mspd > mspd_normal)
       {
        mspd -= .1;
        sp -= 1;
       }
    //dashJump = false;
    if (place_meeting(x, y+1, obj_boundary))
       {
        doubleTapWindow = false;
        dashJump = false;
        dashing = false;
        drive = false;
        charging = false;
        chargeOne = false;
        chargeTwo = false;
        alarm[3] = -1;
        alarm[4] = -1;
        dash = 1;
        sprite_index = spr_player;
        mspd = mspd_normal;
       }
   }                 
