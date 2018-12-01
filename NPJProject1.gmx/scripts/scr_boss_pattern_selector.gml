///Select the next pattern to run
//show_debug_message("Run Pattern 3.");
/*step = 0;
destination = 0;
destination_established = false;*/
if (set_selected == false)
   {
    set_selected = true;
    set_length = string_length(sets[set_index]);
    current_index = 0;
    count = 0;
    var index_number = 0;
    var digit = 0;
    for (i = 1; i < set_length; i++)
        {
         //show_debug_message("string: " + string(i) + " = " + string(string_char_at(sets[set_index],i)));
         if (string_char_at(sets[set_index],i) != ',')
            {
             
             if (string_char_at(sets[set_index],i) == ';')
                {
                 i++;
                 repeat_index = real(string_char_at(sets[set_index],i));
                }
             else if (string_char_at(sets[set_index],i) == '_')
                {
                 i++;
                 condition_index = real(string_char_at(sets[set_index],i));
                }
             else
                {
                 //show_debug_message("i = " + string(i));
                 index_number = real(string_char_at(sets[set_index],i)) + (index_number * power(10,digit));
                 digit += 1;
                }
            }
         else
            {
             set_array[count] = index_number;
             show_debug_message("Set_Array: " + string(count) + " = " + string(set_array[count]));
             count++;
             index_number = 0;
             digit = 0;
            }
        }
    
   }


if (pattern_selected == false)
   {
    //pattern_index = 11;
    hspd = 0;
    vspd = 0;
    weakpoint.hspd = 0;
    weakpoint.vspd = 0;
    appendage.hspd = 0;
    appendage.vspd = 0;
    blocker.hspd = 0;
    blocker.vspd = 0;
    
    weakpoint.vulnerable = false;
    step = 0;
    destination = 0;
    destination_established = false;
    
    if (current_index == condition_index)
       {
        if (set_index == 0)
           {
            if (instance_exists(obj_boss_canister))
               {
                set_index = 1;
                set_selected = false;
               }
           }
       }
    
    pattern_index = set_array[current_index];
    current_index += 1;
    
    if (current_index >= count)
       {
        current_index = repeat_index;
       }


    if (set_selected == true)
       {
        pattern_selected = true;
        pattern_selector_timer = room_speed * (40/60);
       }
   }
   
if (pattern_selector_timer > 0 && pattern_selected == true)
   {
    pattern_selector_timer -= room_speed * (1/60);
    if (weakpoint.x != x + weakpoint_position_x)
       {
        weakpoint.hspd = sign((x + weakpoint_position_x) - weakpoint.x) * (abs((x + weakpoint_position_x) - weakpoint.x)/5);
       }
    if (weakpoint.y != y + weakpoint_position_y)
       {
        weakpoint.vspd = sign((y + weakpoint_position_y) - weakpoint.y) * (abs((y + weakpoint_position_y) - weakpoint.y)/5);
       }
   }
else if (pattern_selector_timer <= 0 && pattern_selected == true)
   {
    show_debug_message("Time to run pattern " + string(pattern_index+1));
    //weakpoint.vulnerable = true;
    weakpoint.x = x + weakpoint_position_x;
    weakpoint.y = y + weakpoint_position_y;
    pattern_selected = false;
    state = boss_state.active;
   }

//Boss Damage
scr_boss_damage();
     
     
//Collision
scr_boss_collision();

//state = boss_state.active;
    
    
    
    //If Pattern 1 is complete...
    /*if (pattern_index == 0)
       {
        if (!collision_line(x,y,x-700,y,obj_boundary,false,true))
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
                //show_debug_message("Time to S U C K");
                pattern_index = 1;
               }
           }
        else
           {
            if (obj_boss_claw.sprite_index != spr_boss_claw_broken)
               {
                if (appendage.special_HP == 2)
                   {
                    pattern_index = 0;
                   }
                else
                   {
                    pattern_index = 5;
                   }
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
         if (!collision_line(x,y,x-700,y,obj_boundary,false,true))
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
        }*/
