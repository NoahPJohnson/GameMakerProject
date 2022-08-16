//A Stationary shot pattern 

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
        if (step == 1)
           {
            scr_create_projectile(7,260-(10*shots_fired),weakpoint.x,weakpoint.y,obj_projectile);
            
            //Play shoot sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
                }
            }
            shots_fired += 1;
            shot_timer = room_speed * (10/60);
           }
        else if (step == 3)
           {
            scr_create_projectile(7,190+(10*shots_fired),weakpoint.x,weakpoint.y,obj_projectile);
            
            //Play shoot sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
                }
            }
            shots_fired += 1;
            shot_timer = room_speed * (10/60);
           }
        else
           {
            scr_create_projectile(4,170,weakpoint.x,weakpoint.y,obj_projectile_homing_boss);
            
            //Play shoot sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
                }
            }
            shots_fired += 1;
           }
       }
    else if (shots_fired == max_shots && shot_timer <= 0)
       {
        show_debug_message("Stop shooting.");
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
    
    //Fire a homing missle
    if (step == 0)
       {
        weakpoint.vulnerable = true;
        shots_fired = 0;
        max_shots = 1;
        firing = true;
        shot_timer = room_speed * (45/60);
        //step = 1;
        //show_debug_message("Fire Homing Missile! Step = " + string(step) + " Shots Fired = " + string(shots_fired));
       }
    //Fan shots forward
    else if (step == 1)
       {
        shots_fired = 0;
        max_shots = 9;
        firing = true;
        shot_timer = room_speed * (80/60);
        //step = 2;
        //show_debug_message("Fan Shots! Step = " + string(step) + " Shots Fired = " + string(shots_fired));
       }
    //Fire another homing missle
    else if (step == 2)
       {
        
        shots_fired = 0;
        max_shots = 1;
        firing = true;
        shot_timer = room_speed * (45/60);
        //step = 3;
        //show_debug_message("Fire Homing Missile 2! Step = " + string(step) + " Shots Fired = " + string(shots_fired));
       }
    //Fan shots back
    else if (step == 3)
       {
        shots_fired = 0;
        max_shots = 9;
        firing = true;
        shot_timer = room_speed * (80/60);
        //step = 4;
        //show_debug_message("FAN SHOTS 2! Step = " + string(step) + " Shots Fired = " + string(shots_fired));
       }
    else if (step == 4)
       {
        
        shots_fired = 0;
        max_shots = 1;
        firing = true;
        shot_timer = room_speed * (40/60);
        //step = 3;
        //show_debug_message("Fire Homing Missile 2! Step = " + string(step) + " Shots Fired = " + string(shots_fired));
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
