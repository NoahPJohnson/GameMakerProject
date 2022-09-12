//Fire explosive canister, shoot it, switch to grab if shot fails, shoot again

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
appendage.hspd = hspd;
appendage.vspd = vspd;
blocker.hspd   = hspd;
blocker.vspd   = vspd;

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }

if (firing == false)
   {
    if (step > 0)
       {
        hspd = dir * chsSpeed;
       }
    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + "Dir = " + string(dir));
   }
else
   {
    hspd = 0;
    dir = 0;
    if (shot_timer <= 0)
       {
        if (step == 2)
           {
            //show_debug_message("Shoot Canister");
            instance_create(x-16,y-192,obj_boss_canister);
            
            //Play canister sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_boss_launch_canister_SFX,other,false);    
                }
            }
            
            shot_timer = room_speed * (130/60);
            //firing = false;
            step = 3;
           }
        else if (step == 3)
           {
            show_debug_message("Done shooting.");
            firing = false;
           }
       }
   }

if ((sign(destination - x) != dir || dir == 0) && firing == false)
   {
    destination_established = false;
    //show_debug_message("Destination reached for step: " + string(step));
   }
   
if (destination_established == false && firing == false)
   {
    //Go to starting position
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        destination = boss_starting_position_x;
        destination_established = true;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Shoot canister
    else if (step == 1)
       {
        weakpoint.vulnerable = true;
        shot_timer = room_speed * (80/60);
        step = 2;
        firing = true;
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    else if (step == 3)
       {
        //PatternComplete
        show_debug_message("Pattern 3 complete.");
        state = boss_state.neutral;
       }
    dir = sign(destination - appendage.x);
   }
     
//Collision
scr_boss_collision();
