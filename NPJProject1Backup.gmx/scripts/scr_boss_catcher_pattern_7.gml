//Attack player by swinging the broken claw

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
blocker.hspd   = hspd;
blocker.vspd   = vspd;

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }
   
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += appendage.hspd; 
    melee_hitbox.y += appendage.vspd;  
   }
   
if (firing == false)
   {
    if (step == 5)
       {
        appendage.vspd = dir_y * acceleration_factor;
        if (acceleration_factor < 10)
           {
            acceleration_factor += room_speed * (0.6/60);
           }
       }
    else
       {
        appendage.hspd = dir_x * 4;
        appendage.vspd = dir_y * 4;
       }
   }
else
   {
    appendage.hspd = 0;
    dir = 0;
    dir_x = 0;
    //dir_y = 0;
    if (step == 9)
       {
        if (shot_timer <= 0)
           {
            player_caught = true;
            firing = false;
            show_debug_message("Done shaking.");
            //step = 9;       
           }
        else 
           {
            appendage.vspd = 16*sin(shot_timer/3);
            
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
            show_debug_message("Shake!  " + string(shot_timer));
           }
       }
    else
       {
        if (shot_timer <= 0)
           {
            firing = false;      
            show_debug_message("Done waiting.");
           }
       }
   }

if ((((sign(destination_x - appendage.x) != dir_x || dir_x == 0)) || (appendage.hspd == 0)) && destination_x_established == true && firing == false)
   {
    appendage.hspd = 0;
    dir_x = 0;
    destination_x_established = false;
    if (step == 9 && player_caught = false)
       {
        if (obj_player.y <= appendage.y)
           {
            firing = true;
            shot_timer = 180;
           }
       }
    show_debug_message("Horizontal Destination reached for step: " + string(step));
   }
if ((((sign(destination_y - appendage.y) != dir_y || dir_y == 0)) || (appendage.vspd == 0)) && destination_y_established && firing == false)
   {
    appendage.vspd = 0;
    dir_y = 0;
    destination_y_established = false;
    show_debug_message("Vertical Destination reached for step: " + string(step));
   }
   
if (destination_x_established == false && destination_y_established == false && firing == false)
   {
    
    //Extend Arm
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        destination_x = x - 180;
        destination_x_established = true;
        acceleration_factor = 1;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Raise Arm V
    else if (step == 1)
       {
        weakpoint.vulnerable = true;
        shots_fired = 0;
        max_shots = 3;
        destination_y = y-26;
        destination_y_established = true;
        step = 2;
        
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Begin Attack H
    else if (step == 2)
       {
        //If player is not on top of the arm...
        if (obj_player.y > appendage.y)
           {
            if (abs(x - obj_player.x) < 130)
               {
                show_debug_message("player too close keep fist a minimum distance from the boss.");
                destination_x = x - 160;
               }
            //Seek them out if they are in range
            else if (abs(x - obj_player.x) < 340)
               {
                show_debug_message("Player is in Range.");
                destination_x = obj_player.x;
               }
            //Or extend to this point if they are out of range
            else if (abs(x - obj_player.x) >= 340)
               {
                show_debug_message("Player is TOO FAR!");
                destination_x = x - 310; 
               }
            destination_x_established = true;
            step = 3;
            show_debug_message("Find next spot to pound. Destination = " + string(destination_x));
           }
        else
           {
            step = 8;
            show_debug_message("Player is on the claw, go to step 8.");
           }
        
       }
    //Raise Claw before pound V
    else if (step == 3)
       {
        shots_fired += 1;
        destination_y = y-70;
        destination_y_established = true;
        step = 4;
        melee_hitbox = instance_create(appendage.x,appendage.y+20,obj_claw_hitbox_boss);
        show_debug_message("Short Raise before pound.");
       }
    //Pound! V
    else if (step == 4)
       {
        //this step is for attacking
        //do three pounds
        //if player jumps on the claw, interrupt with shake off and go directly to next step
        destination_y = y+70;
        destination_y_established = true;
        step = 5;
        show_debug_message("Begin Pound! Shots fired = " + string(shots_fired));
        
        //Play woosh sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
            }
        }
       }
    //Pause before lift
    else if (step == 5)
       {
        firing = true;
        shot_timer = room_speed * (25/60);
        step = 6;
        show_debug_message("Wait a moment!");
        
        //Play contact sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
            }
        }
        
        if (instance_exists(melee_hitbox))
           {
            instance_destroy(melee_hitbox);
           }
       }
    //Raise for next pound V
    else if (step == 6)
       {
        acceleration_factor = 1;
        destination_y = y-26;
        destination_y_established = true;
        step = 7;
        show_debug_message("Raise the fist for next pound.");
       }
    //Reset to step 2
    else if (step == 7)
       {
        //instance_create(weakpoint.x,weakpoint.y,obj_projectile);
        if (shots_fired < max_shots)
           {
            step = 2;
            show_debug_message("Go back to step 2");
           }
        else
           {
            step = 8;
            show_debug_message("Continue to step 8");
           }
       }
    //End the attack H
    else if (step == 8)
       {
        /*destination_x = appendage_position_x+x;;
        destination_x_established = true;
        step = 9;*/
        //End the attack H
        destination_x = x - 180;
        destination_x_established = true;
        step = 9;
        show_debug_message("End the attack.");
       }
    //Return to y position V
    else if (step == 9)
       {
        //weakpoint.vulnerable = false;
        //player_caught = false;
        appendage.vspd = 0;
        destination_y = appendage_position_y+y;
        destination_y_established = true;
        step = 10;
        melee_hitbox = instance_create(appendage.x,appendage.y+20,obj_claw_hitbox_boss);
        show_debug_message("Return to vertical position.");
       }
    //Return to x position H
    else if (step == 10)
       {
        weakpoint.vulnerable = false;
        player_caught = false;
        appendage.vspd = 0;
        destination_x = appendage_position_x+x;
        destination_x_established = true;
        step = 11;
        if (instance_exists(melee_hitbox))
           {
            instance_destroy(melee_hitbox);
           }
        show_debug_message("Return to HORIZONTAL position.");
       }
    else if (step == 11)
       {
        //PatternComplete
        if (appendage.sprite_index != spr_boss_claw_broken)
           {
            //appendage.sprite_index = spr_boss_claw;
           }
        state = boss_state.neutral;
       }
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
   
     
//Collision
scr_boss_collision();

