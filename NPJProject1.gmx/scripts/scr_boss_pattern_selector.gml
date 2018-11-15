///Select the next pattern to run
//show_debug_message("Run Pattern 3.");
/*step = 0;
destination = 0;
destination_established = false;*/

if (pattern_selected == false)
   {
    weakpoint.vulnerable = false;
    step = 0;
    destination = 0;
    destination_established = false;
    //If Pattern 1 is complete...
    if (pattern_index == 0)
       {
        if (!collision_line(x,y,x-400,y,obj_boundary,false,true))
           {
            if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
               {
                if (abs(x-obj_player.x) > 400)
                   {
                    pattern_index = 4;
                   }
                else
                   {
                    pattern_index = 1;
                   }
               } 
            else
               {
                pattern_index = 6;
               }
            if (instance_exists(obj_boss_canister))
               {
                pattern_index = 3;
               }
           }
        else
           {
            pattern_index = 4;
           }    
       }
    //If Pattern 2 is complete...
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
    //If Pattern 3 is complete...
    else if (pattern_index == 2)
       {
        if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
           {
            if (instance_exists(obj_boss_canister))
               {
                //show_debug_message("Shoot AT the canister.");
                pattern_index = 3;
               }
            else
               {
                pattern_index = 0;
               }
           }
        else
           {
            if (instance_exists(obj_boss_canister))
               {
                //show_debug_message("Shoot AT the canister.");
                pattern_index = 6;
               }
            else
               {
                pattern_index = 0;
               }
           }
       }
    //If Pattern 4 is complete...
    else if (pattern_index == 3)
       {
        if (instance_exists(obj_boss_canister))
           {
            if (abs(x-obj_player.x) > 400)
               {
                pattern_index = 0;
               }
            else
               {
                show_debug_message("Time to S U C K");
                pattern_index = 1;
               }
           }
        else
           {
            if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
               {
                pattern_index = 5;
               }
            else
               {
                pattern_index = 6;
               }
           }
        }
    //If Pattern 5 is complete...
    else if (pattern_index == 4)
        {
         if (abs(x-obj_player.x) > 500)
            {
             pattern_index = 0;
            }
         else
            {
             if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
                {
                 pattern_index = 5;
                }
             else
                {
                 pattern_index = 2;
                }
            }
         if (instance_exists(obj_boss_canister))
            {
             pattern_index = 3;
            }
        }
    //If Pattern 6 is complete...
    else if (pattern_index == 5)
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
    //If Pattern 7 is complete...
    else if (pattern_index == 6)
        {
         if (!collision_line(x,y,x-400,y,obj_boundary,false,true))
            {
             if (abs(x-obj_player.x) <= 400)
                {
                 pattern_index = 0;
                }
             else
                {
                 pattern_index = 7;
                }
            }
         else
            {
             pattern_index = 4;
            }
        }
    //If Pattern 8 is complete... 
    else if (pattern_index == 7)
        {
         if (abs(x-obj_player.x) > 500)
            {
             pattern_index = 0;
            }
         else
            {
             pattern_index = 2;
            }
         if (instance_exists(obj_boss_canister))
            {
             pattern_index = 3;
            }
         //pattern_index = 6;
        }
    pattern_selected = true;
    pattern_selector_timer = room_speed * (40/60);
   }
   
if (pattern_selector_timer > 0 && pattern_selected == true)
   {
    pattern_selector_timer -= room_speed * (1/60);
   }
else if (pattern_selector_timer <= 0 && pattern_selected == true)
   {
    show_debug_message("Time to run pattern " + string(pattern_index));
    //weakpoint.vulnerable = true;
    pattern_selected = false;
    state = boss_state.active;
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
    saved_pattern_selector_timer = pattern_selector_timer;
    old_state = state;
    alarm[0] = weakpoint.alarm[0];
    damage_hitstop = weakpoint.damage_hitstop;
    state = boss_state.hitstop;
   }
     
//Collision
scr_boss_collision();

//state = boss_state.active;
