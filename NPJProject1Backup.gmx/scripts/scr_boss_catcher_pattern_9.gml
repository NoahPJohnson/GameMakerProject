//Fire explosive canister and pre shoot to detonate it low to the ground 
//(player can reflect projectile to detonate canister on head)

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
            //instance_create(x-80,y-250,obj_boss_canister);
            //shot_timer = room_speed * (14/60);
            shots_fired = 0;
            max_shots = 4;
            //instance_create(weakpoint.x,weakpoint.y,obj_projectile_canister_air_burst);
            scr_create_projectile(6.5,227,weakpoint.x,weakpoint.y,obj_projectile_canister_air_burst);
            
            //Play shoot sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
                }
            }
            
            shots_fired += 1;
            shot_timer = room_speed * (28/60);
            //firing = false;
            step = 3;
           }
        else if (step == 3 && shots_fired >= max_shots)
           {
            firing = false;
            step = 4;
           }
        else if (step == 3)
           {
            if (shots_fired == 2)
               {
                show_debug_message("Shoot Canister");
                //instance_create(x-80,y-260,obj_boss_canister);
                scr_create_projectile(14,115,x-24,y-225,obj_boss_canister);
                
                //Play canister sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_boss_launch_canister_SFX,other,false);    
                    }
                }
                
                //shot_timer += room_speed * (9/60);
                //shots_fired += 1;
               }
            if (shots_fired < max_shots)
               {
                scr_create_projectile(6.5,230,weakpoint.x,weakpoint.y,obj_projectile_canister_air_burst);
                
                //Play shoot sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_enemy_fire_shot_SFX,other,false);    
                    }
                }
                
                shots_fired += 1;
                shot_timer = room_speed * (28/60);
               }
            //show_debug_message("Done shooting.");
            //firing = false;
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
    else if (step == 4)
       {
        //PatternComplete
        show_debug_message("Pattern 8 complete.");
        state = boss_state.neutral;
       }
    dir = sign(destination - appendage.x);
   }

   
//Collision
scr_boss_collision();
