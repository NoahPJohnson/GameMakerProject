//Attack player by punching with the broken claw

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

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }

if (firing == false)
   {
    if (step == 1 && destination_established == true)
       {
        hspd = dir * chsSpeed;
       }
    else if ((step == 5 || step == 7) && destination_established == true)
       {
        if (step == 7)
           {
            appendage.vspd = dir * 4;
           }
        else
           {
            appendage.vspd = dir * 8
           } 
       }
    else if (step > 0 && destination_established == true)
       {
        if (step == 3)
           {
            appendage.hspd = dir * acceleration_factor;
            if (acceleration_factor < 14)
               {
                acceleration_factor += room_speed * (0.7/60);
                //show_debug_message("Acceleration = " + string(acceleration_factor));
               }
           }
        else if (step == 4)
           {
            appendage.hspd = dir * 12;
           }
        else
           {
            appendage.hspd = dir * 6;
           }
        //appendage.x = dir*clamp(dir*appendage.x,dir*start_point,dir*destination);
        //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
       }
    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + " Dir = " + string(dir));
   }
else
   {
    appendage.hspd = 0;
    //appendage.vspd = 0;
    //dir = 0;
    if (shot_timer <= 0)
       {
        appendage.vspd = 0;
        shots_fired += 1;
        firing = false;
        acceleration_factor = 1;
        //step = 7;       
       }
    else 
       {
        appendage.vspd = sin(shot_timer)*2;
       }
   }
if (step == 1)
   {
    if ((sign(destination - x) != dir || dir == 0) && firing == false)
       {
        hspd = 0;
        dir = 0;
        destination_established = false;
       }
   }
else if (step == 5 || step == 7)
   {
    if ((sign(destination - appendage.y) != dir || dir == 0) && firing == false)
       {
        appendage.vspd = 0;
        dir = 0;
        destination_established = false;
       }
   }
else
   {
    if ((sign(destination - appendage.x) != dir || dir == 0) && firing == false)
       {
        appendage.hspd = 0;
        dir = 0;
        destination_established = false;
        if (step == 4 && shots_fired >= max_shots)
           {
            step = 6;       
           }
        //show_debug_message("Destination reached for step: " + string(step));
       }
   }
   
if (destination_established == false && firing == false)
   {
    
    //Approach the player sH
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        destination = boss_starting_position_x - 300;
        destination_established = true;
        shots_fired = 0;
        max_shots = 3;
        acceleration_factor = 1;
        appendage.jumping = true;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Pull arm back H
    else if (step == 1)
       {
        weakpoint.vulnerable = true;
        destination = x;
        destination_established = true;
        step = 2;
        
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Punch! H
    else if (step == 2)
       {
        //this step is for attacking
        //do three punches
        destination = x-310;
        destination_established = true;
        step = 3;
       }
    //Return arm to neutral H
    else if (step == 3)
       {
        destination = (appendage_position_x+x)-64;
        destination_established = true;
        firing = true;
        shot_timer = room_speed * (40/60);
        step = 4;  
       }
    //Raise arm for next punch V
    else if (step == 4)
       {
        destination = (appendage_position_y+y)-(50*shots_fired);
        destination_established = true;
        step = 5;
       }
    //Reset to step 1
    else if (step == 5)
       {
        step = 1;
       }
    //End the attack V
    else if (step == 6)
       {
        destination = appendage_position_y+y;
        destination_established = true;
        step = 7;
       }
    //Return to x position H
    else if (step == 7)
       {
        weakpoint.vulnerable = false;
        player_caught = false;
        appendage.vspd = 0;
        destination = appendage_position_x+x;
        destination_established = true;
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
        dir = sign(destination - x);
       }
    else if (step == 5 || step == 7)
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

