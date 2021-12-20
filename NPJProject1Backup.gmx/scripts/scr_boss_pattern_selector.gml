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
    dir = 0;
    dir_x = 0;
    dir_y = 0;
    destination = 0;
    destination_x = 0;
    destination_y = 0;
    destination_established = false;
    destination_x_established = false;
    destination_y_established = false;
     
    if (current_index == condition_index)
       {
        show_debug_message("C H E C K  TO SWITCH SET!!! Set: " + string(set_index) + "* * * * *");
        if (set_index == 0)
           {
            if (appendage.special_HP < 1)
               {
                set_index = 2;
                set_selected = false;
                show_debug_message("SWITCH to set 2");
               }
            else if (appendage.special_HP < 2)
               {
                set_index = 1;
                set_selected = false;
                show_debug_message("Switch to set 1");
               }
           }
        else if (set_index == 1)
           {
            if (appendage.special_HP < 1)
               {
                set_index = 2;
                set_selected = false;
               }
           }
        else if (set_index == 2)
           {
            if (hp < (max_hp*0.5))
               {
                set_index = 3;
                set_selected = false;
               }
           }
        else if (set_index == 3)
           {
            if (hp < (max_hp*0.25))
               {
                set_index = 4;
                set_selected = false;
               }
           }
       }
    if (current_index >= count)
       {
        current_index = repeat_index;
       }
    /*else
       {
        show_debug_message("Current Index: " + string(current_index) + " < Count: " + string(count));
       }*/
       
    pattern_index = set_array[current_index];
    current_index += 1;
    
    


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
//scr_boss_damage();
     
     
//Collision
scr_boss_collision();
