//Activate Tractor Beam and shoot at the player

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
    if (step > 0 && destination_established == true)
       {
        appendage.hspd = dir;
       }
    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + "Dir = " + string(dir));
   }
else
   {
    appendage.hspd = 0;
    dir = 0;
    if (shot_timer % 100 == 0)
       {
        if (shots_fired < max_shots)
           {
            //show_debug_message("Time to shoot at: " + string(shot_timer));
            show_debug_message("Bang. shots fired = " + string(shots_fired));
            //create projectile
            instance_create(weakpoint.x, weakpoint.y, obj_projectile);
            shots_fired += 1;
            shot_timer += (room_speed * (25/60));  
           }
        else if (shots_fired == max_shots)
           {
            show_debug_message("Stop shooting.");
            shots_fired = 0;
            max_shots = 3;
            //firing = false;
            //step += 1;
           }
       } 
    if (shot_timer <= 0)
       {
        show_debug_message("Tractor Beam Finished");
        firing = false;
        if (instance_exists(obj_boss_canister))
           {
            if (obj_boss_canister.contained_detonation == true)
               {
                appendage.sprite_index = spr_boss_claw_broken;
                hp -= 7;
                instance_create(appendage.x,appendage.y+20,obj_claw_hitbox_boss);
               }
            else
               {
                appendage.sprite_index = spr_boss_claw_attack; 
               }
           }
        else
           {
            appendage.sprite_index = spr_boss_claw_attack; 
           }
        instance_create(appendage.x,appendage.y,obj_explosion_hitbox);       
       }
    else 
       {
        //show_debug_message("Succ");
        //Player affected
        appendage.vspd = sin(shot_timer);
        if (appendage.x-obj_player.x > 5 && appendage.x-obj_player.x < tractor_beam_range && abs(appendage.y-obj_player.y) > 5 && abs(appendage.y-obj_player.y) < 64)
           {
            if (obj_player.state != states.hitstop && obj_player.state != states.knockback)
               {
                if (appendage.x-obj_player.x > 5 && appendage.x-obj_player.x < tractor_beam_range)
                   {
                    with (obj_player)
                         {
                          if (!place_meeting(x + (sign(obj_boss_main_body.appendage.x-x)*5),y,obj_boss_canister))
                             {
                              x += sign(obj_boss_main_body.appendage.x-x) * 5;
                             }
                         }
                    //obj_player.x += sign(appendage.x-obj_player.x) * 5;
                   }
                if (abs(appendage.y-obj_player.y) > 5 && abs(appendage.y-obj_player.y) < 64 && abs(appendage.x-obj_player.x) < 80)
                   {
                    with (obj_player)
                         {
                          if (!place_meeting(x,y + (sign(obj_boss_main_body.appendage.y-y)*5),obj_boss_canister))
                             {
                              y += sign(obj_boss_main_body.appendage.y-y) * 5;
                             }
                         }
                    //obj_player.y += sign(appendage.y-obj_player.y) * 5;
                   }
               }
           }
        if (abs(appendage.x-obj_player.x) < 48 && abs(appendage.y-obj_player.y) < 16)
           {
            show_debug_message("Caught Player!");
            if (player_caught == false)
               {
                player_caught = true;
                shot_timer = 35;
               }
            //instance_create(appendage.x,appendage.y,obj_explosion_hitbox);
            //appendage.sprite_index = spr_boss_claw_attack;
           }
        //Canister Affected
        if (instance_exists(obj_boss_canister))
           {
            if (appendage.x-obj_boss_canister.x > 5 && appendage.x-obj_boss_canister.x < tractor_beam_range && abs(appendage.y-obj_boss_canister.y) > 5 && abs(appendage.y-obj_boss_canister.y) < 64)
               {
                if (appendage.x-obj_boss_canister.x > 5 && appendage.x-obj_boss_canister.x < tractor_beam_range)
                   {
                    with (obj_boss_canister)
                         {
                          if (!place_meeting(x+(sign(obj_boss_main_body.appendage.x-x)) * 4,y,obj_player))
                             {
                              x += sign(obj_boss_main_body.appendage.x-x) * 4;
                             }
                         }
                    //obj_boss_canister.x += sign(appendage.x-obj_boss_canister.x) * 4;
                   }
                if (abs(appendage.y-obj_boss_canister.y) > 5 && abs(appendage.y-obj_boss_canister.y) < 64 && abs(appendage.x-obj_boss_canister.x) < 80)
                   {
                    with (obj_boss_canister)
                         {
                          if (!place_meeting(x,y+(sign(obj_boss_main_body.appendage.y-y)) * 4,obj_player))
                             {
                              y += sign(obj_boss_main_body.appendage.y-y) * 4;
                             }
                         }
                    //obj_boss_canister.y += sign(appendage.y-obj_boss_canister.y) * 4;
                   }
               }
            if (abs(appendage.x-obj_boss_canister.x) < 48 && abs(appendage.y-obj_boss_canister.y) < 16)
               {
                show_debug_message("Caught CANISTER!!");
                if (player_caught == false)
                   {
                    player_caught = true;
                    obj_boss_canister.contained_detonation = true;
                    shot_timer = 35;
                   }
                //instance_create(appendage.x,appendage.y,obj_explosion_hitbox);
                //appendage.sprite_index = spr_boss_claw_attack;
               }
           }
       }
   }

if ((sign(destination - appendage.x) != dir || dir == 0) && firing == false)
   {
    appendage.hspd = 0;
    dir = 0;
    destination_established = false;
    //show_debug_message("Destination reached for step: " + string(step));
   }
   
if (destination_established == false && firing == false)
   {
    //Extend Arm
    if (step == 0)
       {
        weakpoint.vulnerable = false;
        shots_fired = 0;
        max_shots = 3;
        destination = x - 160;
        destination_established = true;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Activate Tractor Beam
    else if (step == 1)
       {
        weakpoint.vulnerable = true;
        player_caught = false;
        destination = appendage.x;
        shot_timer = room_speed * (310/60);
        step = 2;
        firing = true;
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    else if (step == 2)
       {
        player_caught = false;
        appendage.vspd = 0;
        appendage.y = appendage_position_y+y;
        destination = appendage_position_x+x;
        destination_established = true;
        step = 3;
       }
    else if (step == 3)
       {
        show_debug_message("Pattern 6 complete.");
        //PatternComplete
        if (appendage.sprite_index != spr_boss_claw_broken)
           {
            appendage.sprite_index = spr_boss_claw;
           }
        state = boss_state.neutral;
       }
    dir = sign(destination - appendage.x);
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

