//Attack player by swinging the broken claw and shooting between swings

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
//appendage.hspd = hspd;
//appendage.vspd = vspd;
blocker.hspd   = hspd;
blocker.vspd   = vspd;

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }

if (firing == false)
   {
    
    if ((step == 2 || step == 4 || step == 5 || step == 6 || step == 9) && destination_established == true)
       {
        if (step == 5)
           {
            appendage.vspd = dir * acceleration_factor;
            if (acceleration_factor < 10)
               {
                acceleration_factor += room_speed * (0.6/60);
                show_debug_message("Acc. = " + string(acceleration_factor));
               }
           }
        else
           {
            appendage.vspd = dir * 4;
           }
        //appendage.y = dir*clamp(dir*appendage.y,dir*start_point,dir*destination);
       }
    else if (step > 0 && destination_established == true)
       {

        appendage.hspd = dir * 4;
        //appendage.x = dir*clamp(dir*appendage.x,dir*start_point,dir*destination);
        //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
       }
    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + " Dir = " + string(dir));
   }
else
   {
    appendage.hspd = 0;
    dir = 0;
    if (shot_timer <= 0)
       {
        player_caught = true;
        firing = false;
        step = 8;       
       }
    else 
       {
        appendage.vspd = 16*sin(shot_timer/3);
       }
   }
if (step == 2 || step == 4 || step == 5 || step == 6 || step == 9)
   {
    if ((sign(destination - appendage.y) != dir || dir == 0) && firing == false)
       {
        appendage.vspd = 0;
        dir = 0;
        destination_established = false;
        /*if (obj_player.y > appendage.y)
           {
            player_caught = false;
           }
        else
           {
            player_caught = true;
           }*/
        //show_debug_message("Vertical Destination reached for step: " + string(step));
       }
   }
else
   {
    if ((sign(destination - appendage.x) != dir || dir == 0) && firing == false)
       {
        appendage.hspd = 0;
        dir = 0;
        destination_established = false;
        if (step == 8 && player_caught = false)
           {
            if (obj_player.y <= appendage.y)
               {
                firing = true;
                shot_timer = 180;
               }
           }
        show_debug_message("Destination reached for step: " + string(step));
       }
   }
   
if (destination_established == false && firing == false)
   {
    
    //Extend Arm
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        destination = x - 180;
        destination_established = true;
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
        destination = y-48;
        destination_established = true;
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
                destination = x - 160;
               }
            //Seek them out if they are in range
            else if (abs(x - obj_player.x) < 340)
               {
                show_debug_message("Player is in Range.");
                destination = obj_player.x;
               }
            //Or extend to this point if they are out of range
            else if (abs(x - obj_player.x) >= 340)
               {
                show_debug_message("Player is TOO FAR!");
                destination = x - 310; 
               }
            destination_established = true;
            step = 3;
            show_debug_message("Find next spot to pound. Destination = " + string(destination));
           }
        else
           {
            step = 7;
           }
       }
    //Raise Claw before pound V
    else if (step == 3)
       {
        if (shots_fired < max_shots)
           {
            shots_fired += 1;
            destination = y-80;
            destination_established = true;
            step = 4;
           }
        else
           {
            step = 7;
           }
       }
    //Pound! V
    else if (step == 4)
       {
        //this step is for attacking
        //do three pounds
        //if player jumps on the claw, interrupt with shake off and go directly to next step
        destination = y+70;
        destination_established = true;
        step = 5;
        show_debug_message("Begin Pound! Shots fired = " + string(shots_fired))
       }
    //Raise for next pound V
    else if (step == 5)
       {
        acceleration_factor = 1;
        destination = y-48;
        destination_established = true;
        step = 6;
       }
    //Reset to step 2
    else if (step == 6)
       {
        instance_create(weakpoint.x,weakpoint.y,obj_projectile);
        step = 2;
       }
    //End the attack H
    else if (step == 7)
       {
        destination = x - 180;
        destination_established = true;
        step = 8;
       }
    //Return to y position V
    else if (step == 8)
       {
        appendage.vspd = 0;
        destination = appendage_position_y+y;
        destination_established = true;
        step = 9;
       }
    //Return to x position H
    else if (step == 9)
       {
        weakpoint.vulnerable = false;
        player_caught = false;
        appendage.vspd = 0;
        destination = appendage_position_x+x;
        destination_established = true;
        step = 10;
       }
    else if (step == 10)
       {
        //PatternComplete
        if (appendage.sprite_index != spr_boss_claw_broken)
           {
            appendage.sprite_index = spr_boss_claw;
           }
        state = boss_state.neutral;
       }
    else if (step == 10)
       {
        //step = 7;
       }
    if (step == 2 || step == 4 || step == 5 || step == 6 || step == 9)
       {
        start_point = appendage.y;
        dir = sign(destination - appendage.y);
       }
    else
       {
        start_point = appendage.x;
        dir = sign(destination - appendage.x);
       }
   }
   
     
//Collision
scr_boss_collision();

