//Shoot the canister

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
        //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + "Dir = " + string(dir));
       }
   }
else
   {
    hspd = 0;
    if (shots_fired < max_shots && shot_timer <= 0)
       {
        
        
        //show_debug_message("Bang. shots fired = " + string(shots_fired));
        scr_create_projectile(6,point_direction(weakpoint.x,weakpoint.y,obj_boss_canister.x,obj_boss_canister.y+20),weakpoint.x,weakpoint.y,obj_projectile);
        //instance_create(weakpoint.x, weakpoint.y, obj_projectile_canister);
        shots_fired += 1;
        shot_timer = room_speed * (30/60);  
       }
    else if (shots_fired == max_shots && shot_timer <= 0)
       {
        //show_debug_message("Stop shooting.");
        firing = false;
        step = 2;
       }
   }
   
if ((sign(destination - x) != dir || dir == 0) && firing == false && step > 0)
   {
    destination_established = false;
    //show_debug_message("Destination reached for step: " + string(step));
   }
   

if (destination_established == false && firing == false)
   {
    if (step == 0)
       {
        weakpoint.vulnerable = true;
        destination = boss_starting_position_x;
        destination_established = true;
        step = 1;
       }
    //Shoot
    else if (step == 1)
       {
        shot_timer = room_speed * (55/60); 
        destination = x;
        firing = true;
        shots_fired = 0;
        max_shots = 3;
       }
    else if (step == 2)
       {
        //PatternComplete
        state = boss_state.neutral;
       }
    dir = sign(destination - x);
   }

//Collision
scr_boss_collision();
