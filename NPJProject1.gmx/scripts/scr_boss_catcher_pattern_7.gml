//Attack player by swinging the broken claw

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
//appendage.hspd = hspd;
//appendage.vspd = vspd;

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }

if (firing == false)
   {
    
    if ((step == 2 || step == 4 || step == 5 || step == 8) && destination_established == true)
       {
        if (step == 4)
           {
            appendage.vspd = dir * 6;
           }
        else
           {
            appendage.vspd = dir * 2;
           }
        //appendage.y = dir*clamp(dir*appendage.y,dir*start_point,dir*destination);
       }
    else if (step > 0 && destination_established == true)
       {
        appendage.hspd = dir * 2;
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
        step = 7;       
       }
    else 
       {
        appendage.vspd = 8*sin(shot_timer/2);
       }
   }
if (step == 2 || step == 4 || step == 5 || step == 8)
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
        if (step == 7 && player_caught = false)
           {
            if (obj_player.y <= appendage.y)
               {
                firing = true;
                shot_timer = 180;
               }
           }
        //show_debug_message("Destination reached for step: " + string(step));
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
            step = 6;
           }
       }
    //Pound! V
    else if (step == 3)
       {
        //this step is for attacking
        //do three pounds
        //if player jumps on the claw, interrupt with shake off and go directly to next step
        if (shots_fired < max_shots)
           {
            shots_fired += 1;
            destination = y+70;
            destination_established = true;
            step = 4;
            show_debug_message("Begin Pound! Shots fired = " + string(shots_fired))
           }
        else 
           {
            step = 6;
           }
       }
    //Raise for next pound V
    else if (step == 4)
       {
        destination = y-48;
        destination_established = true;
        step = 5;
       }
    //Reset to step 2
    else if (step == 5)
       {
        step = 2;
       }
    //End the attack H
    else if (step == 6)
       {
        destination = x - 180;
        destination_established = true;
        step = 7;
       }
    //Return to y position V
    else if (step == 7)
       {
        appendage.vspd = 0;
        destination = appendage_position_y+y;
        destination_established = true;
        step = 8;
       }
    //Return to x position H
    else if (step == 8)
       {
        weakpoint.vulnerable = false;
        player_caught = false;
        appendage.vspd = 0;
        destination = appendage_position_x+x;
        destination_established = true;
        step = 9;
       }
    else if (step == 9)
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
    if (step == 2 || step == 4 || step == 5 || step == 8)
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
   
//Hit by projectile
scr_boss_hit_by_projectile();

with (weakpoint)
     {
      scr_boss_hit_by_projectile();
     }

   
//Hit by bat
scr_boss_hit_by_bat();

with (weakpoint)
     {
      scr_boss_hit_by_bat();
     }


if (weakpoint.state == boss_state.hitstop)
   {
    saved_shot_timer = shot_timer;
    old_state = state;
    alarm[0] = weakpoint.alarm[0];
    damage_hitstop = weakpoint.damage_hitstop;
    state = boss_state.hitstop;
   }
     
//Collision
scr_boss_collision();

