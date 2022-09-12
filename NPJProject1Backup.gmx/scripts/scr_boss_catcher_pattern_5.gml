//The Reverse of pattern 1

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

//dir = sign(destination - x);
if (firing == false)
   {
    if (step > 0)
       {
        hspd = dir * chsSpeed;
       }
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + "Dir = " + string(dir));
   }
else
   {
    hspd = 0;
    if (shots_fired < max_shots && shot_timer <= 0)
       {
        
        
        //show_debug_message("Bang. shots fired = " + string(shots_fired));
        //create projectile
        instance_create(weakpoint.x, weakpoint.y, obj_projectile);
        
        //Play shoot sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
            }
        }
            
        shots_fired += 1;
        shot_timer = room_speed * (25/60);  
       }
    else if (shots_fired == max_shots && shot_timer <= 0)
       {
        //show_debug_message("Stop shooting.");
        firing = false;
        step += 1;
       }
   }
   
if ((sign(destination - x) != dir || dir == 0) && firing == false)
   {
    destination_established = false;
    //show_debug_message("Destination reached for step: " + string(step));
   }
   

if (destination_established == false && firing == false)
   {
    
    //Move Forward
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        destination = x + 192;
        destination_established = true;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Move Backward
    else if (step == 2)
       {
        //weakpoint.vulnerable = false;
        destination = x - 128;
        destination_established = true;
        step = 3;
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Move Forward
    else if (step == 4)
       {
        //weakpoint.vulnerable = false;
        destination = x + 192;
        destination_established = true;
        step = 5;
        //show_debug_message("Move Forward Again. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Shoot
    else if (step == 1 || step == 3)
       {
        weakpoint.vulnerable = true;
        destination = x;
        firing = true;
        shots_fired = 0;
        max_shots = 3;
       }
    else if (step == 5)
       {
        //PatternComplete
        state = boss_state.neutral;
       }
    dir = sign(destination - x);
   }

     
//Collision
scr_boss_collision();
