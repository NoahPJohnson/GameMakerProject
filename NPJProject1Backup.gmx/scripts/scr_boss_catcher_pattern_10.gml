//Attack player by punching with the broken claw
//----------------------------------------------------------
//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
if (step == 1)
   {
    appendage.hspd = hspd;
    appendage.vspd = vspd;
   }
blocker.hspd   = hspd;
blocker.vspd   = vspd;

if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += appendage.hspd; 
    melee_hitbox.y += appendage.vspd;  
   }
//----------------------------------------------------------




//----------------------------------------------------------
if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }
//----------------------------------------------------------




//----------------------------------------------------------
if (firing == false)
   {
    if (step == 1)
       {
        hspd = dir_x * chsSpeed;
        appendage.vspd = dir_y * 2;
        show_debug_message("It's step 1, the body should move.");
       }
    else
       {
        if (step == 3)
           {
            appendage.hspd = dir_x * acceleration_factor;
            if (acceleration_factor < 14)
               {
                acceleration_factor += room_speed * (0.7/60);
                show_debug_message("Acceleration = " + string(acceleration_factor));
               }
           }
        else
           {
            appendage.hspd = dir_x * 6;
            appendage.vspd = dir_y * 8;

            show_debug_message("It's not step 1 and not step 3");
           }
        /*else if (step == 4 || step == 7)
           {
            appendage.hspd = dir_x * 6;
            appendage.vspd = dir_y * 4;
           }*/
       }

    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + " Dir = " + string(dir));
   }
else
   {    
    appendage.hspd = 0;
    dir = 0;
    dir_y = 0;
    
    if (shot_timer <= 0)
       {
        appendage.vspd = 0;
        shots_fired += 1;
        firing = false;
        acceleration_factor = 1;

        show_debug_message("shake complete."); 
       }
    else 
       {
        appendage.vspd = sin(shot_timer)*2;
        
        shake_difference = sign(appendage.y-y);
        if (shake_difference != old_shake_difference)
        {
            if (shake_difference > 0) 
            {
                //Play swing sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
                    }
                }
            }
            old_shake_difference = shake_difference;
        }
        
        show_debug_message("shake: " + string(shot_timer));
       }
   }
//---------------------------------------------------------------




//---------------------------------------------------------------
if (step == 1)
   {
    if ((sign(destination_x - x) != dir_x || dir_x == 0) && firing == false && destination_x_established == true)
       {
        hspd = 0;
        dir_x = 0;
        destination_x_established = false;
        show_debug_message("Body's destination reached.");
       }
    if ((sign(destination_y - appendage.y) != dir_y || dir_y == 0) && firing == false && destination_y_established == true)
       {
        appendage.vspd = 0;
        dir_y = 0;
        destination_y_established = false;
        show_debug_message("destination V reached for step: " + string(step));
       }
   }
else
   {
    if ((sign(destination_x - appendage.x) != dir_x || dir_x == 0) && firing == false && destination_x_established == true)
       {
        appendage.hspd = 0;
        dir_x = 0;
        destination_x_established = false;
        show_debug_message("destination H reached for step: " + string(step));
        if (step == 4 && shots_fired >= max_shots)
           {
            step = 6;    
            show_debug_message("All punches thrown.");   
           }
       }
    if ((sign(destination_y - appendage.y) != dir_y || dir_y == 0) && firing == false && destination_y_established == true)
       {
        appendage.vspd = 0;
        dir_y = 0;
        destination_y_established = false;
        show_debug_message("destination V reached for step: " + string(step));
       }

   }
//---------------------------------------------------------------------




//---------------------------------------------------------------------   
if (destination_x_established == false && destination_y_established == false && firing == false)
   {
    
    //Approach the player sH
    if (step == 0)
       {
        //destination_y = appendage.y;
        weakpoint.vulnerable = false;
        destination_x = boss_starting_position_x - 308;
        destination_x_established = true;
        destination_y = ((appendage_position_y+y)+32);
        destination_y_established = true;
        shots_fired = 0;
        max_shots = 3;
        acceleration_factor = 1;
        /*appendage.jumping = true;*/
        step = 1;
        show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination_x));
       }
    //Pull arm back H
    else if (step == 1)
       {
        weakpoint.vulnerable = true;
        destination_x = x;
        destination_x_established = true;
        step = 2;
        show_debug_message("Pull arm back.")
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Punch! H
    else if (step == 2)
       {
        melee_hitbox = instance_create(appendage.x-20,appendage.y,obj_claw_hitbox_boss);
        //this step is for attacking
        //do three punches
        destination_x = x-310;
        destination_x_established = true;
        step = 3;
        
        //Play woosh sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
            }
        }
        
        show_debug_message("Punch!");
       }
    //Return arm to neutral H
    else if (step == 3)
       {
        if (instance_exists(melee_hitbox))
           {
            instance_destroy(melee_hitbox);
           }
        destination_x = (appendage_position_x+x)-64;
        destination_x_established = true;
        firing = true;
        shot_timer = room_speed * (40/60);
        step = 4;
        
        //Play contact sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
            }
        }
        show_debug_message("Return arm to neutral.");  
       }
    //Raise arm for next punch V
    else if (step == 4)
       {
        destination_y = ((appendage_position_y+y)+32)-(56*shots_fired);
        destination_y_established = true;
        step = 5;
        show_debug_message("Raise for next punch.");
       }
    //Reset to step 1
    else if (step == 5)
       {
        step = 1;
        show_debug_message("Go back to step 1.");
       }
    //End the attack V
    else if (step == 6)
       {
        melee_hitbox = instance_create(appendage.x,appendage.y+20,obj_claw_hitbox_boss);
        destination_y = appendage_position_y+y;
        destination_y_established = true;
        step = 7;
        show_debug_message("End the punch attack.");
       }
    //Return to x position H
    else if (step == 7)
       {
        if (instance_exists(melee_hitbox))
           {
            instance_destroy(melee_hitbox);
           }
        weakpoint.vulnerable = false;
        player_caught = false;
        appendage.vspd = 0;
        destination_x = appendage_position_x+x;
        destination_x_established = true;
        step = 8;
       }
    else if (step == 8)
       {
        //PatternComplete
        appendage.jumping = false;
        if (appendage.sprite_index != spr_boss_claw_broken)
           {
            appendage.sprite_index = spr_boss_claw;
           }
        state = boss_state.neutral;
       }
    if (step == 1)
       {
        if (destination_x_established == true)
           {
            dir_x = sign(destination_x - x);
           }
        if (destination_y_established == true)
           {
            dir_y = sign(destination_y - appendage.y);
           }
       }
    else
       {
        start_point_x = appendage.x;
        start_point_y = appendage.y;
        if (destination_x_established == true)
           {
            dir_x = sign(destination_x - appendage.x);
           }
        if (destination_y_established == true)
           {
            dir_y = sign(destination_y - appendage.y);
           }
        show_debug_message("dir_y = " + string(dir_y) + "  dir_x = " + string(dir_x) + " | step = " + string(step));
        show_debug_message("Destination_Y_Established? " + string(destination_y_established) + "    destination_x_established? " + string(destination_x_established));
        show_debug_message("Destination_Y = " + string(destination_y) + "  and  destination_x = " + string(destination_x));
       }
   }
//-----------------------------------------------------------------




//Collision
scr_boss_collision();

