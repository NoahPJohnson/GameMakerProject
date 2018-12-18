if (pause_menu == true)
   {
    key_pause = keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_escape);
   }
else
   {
    key_pause = false;
   }
key_select_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_select_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select_enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift);

if (key_pause)
   {
    if (paused == false)
       {
        paused = true;
        instance_deactivate_all(true);
        for (i = 0; i < array_length_1d(button_array); i ++)
            {
             instance_create(view_xview[0]+(view_wview[0]/2), view_yview[0]+((view_hview[0]/2)-(128-(i*128))), button_array[i]);
            }
        button_array[starting_selected_button_index].button_selected = true;
        //button_array[0].button_selected = true;
       }
    else
       {
        paused = false;
        /*if (instance_exists(obj_controls_menu_object))
           {
            for (i = 0; i < array_length_1d(obj_controls_menu_object.button_array); i ++)
                {
                 instance_destroy(obj_controls_menu_object.button_array[i]);
                }
           }*/
        for (i = 0; i < array_length_1d(button_array); i ++)
            {
             //instance_activate_object(button_array[i]);
             instance_destroy(button_array[i]);
            }
        instance_activate_all();
       }
   }
   
if (paused == true || pause_menu == false)
   {
    //Select up
    if (key_select_up)
       {
        show_debug_message("Select UP.");
        selected_button_index -= 1;
        if (selected_button_index < 0)
           {
            selected_button_index = array_length_1d(button_array) - 1;
           }
        for (i = 0; i < array_length_1d(button_array); i++)
            {
             button_array[i].button_selected = false;
            }
        button_array[selected_button_index].button_selected = true;
       }
    //Select down
    if (key_select_down)
       {
        show_debug_message("Select down.");
        selected_button_index += 1;
        if (selected_button_index > array_length_1d(button_array) - 1)
           {
            selected_button_index = 0;
           }
        for (i = 0; i < array_length_1d(button_array); i++)
            {
             button_array[i].button_selected = false;
            }
        button_array[selected_button_index].button_selected = true;
       }
    //Hit enter on selected button   
    if (key_select_enter)
       {
        show_debug_message("Enter!");
        script_execute(button_array[selected_button_index].button_script);
       }
   }
