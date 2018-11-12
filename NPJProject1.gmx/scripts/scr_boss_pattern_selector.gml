///Select the next pattern to run
//show_debug_message("Run Pattern 3.");
step = 0;
destination = 0;
destination_established = false;
if (pattern_index == 0 && abs(x-obj_player.x) > 400)
   {
    pattern_index = 0;
   }
else if (pattern_index == 0 && abs(x-obj_player.x) <= 400)
   {
    pattern_index = 1;
   }
else if (pattern_index == 1)
   {
    if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
       {
        pattern_index = 2;
       }
    else
       {
        pattern_index = 6;
       }
   }
else if (pattern_index == 2 && instance_exists(obj_boss_canister))
   {
    show_debug_message("Shoot AT the canister.");
    pattern_index = 3;
   }
else if (pattern_index == 3 && instance_exists(obj_boss_canister))
   {
    show_debug_message("Time to S U C K");
    pattern_index = 1;
   }
else if (pattern_index == 3 && !instance_exists(obj_boss_canister))
   {
    pattern_index = 2;
   }

state = boss_state.active;
