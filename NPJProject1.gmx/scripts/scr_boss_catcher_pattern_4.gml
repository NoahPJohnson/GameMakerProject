//Move back and forth and fire shots at the player in between

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
appendage.hspd = hspd;
appendage.vspd = vspd;

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
        
        
        show_debug_message("Bang. shots fired = " + string(shots_fired));
        //create projectile
        instance_create(weakpoint.x, weakpoint.y, obj_projectile_canister);
        shots_fired += 1;
        shot_timer = room_speed * (25/60);  
       }
    else if (shots_fired == max_shots && shot_timer <= 0)
       {
        show_debug_message("Stop shooting.");
        firing = false;
        step += 1;
       }
   }
   
if (abs(destination - x) < 0.2 && firing == false && step > 0)
   {
    destination_established = false;
    show_debug_message("Destination reached for step: " + string(step));
   }
   

if (destination_established == false && firing == false)
   {
    if (step == 0)
       {
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

//Hit by the bat

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
