if (room != rm_main_menu)
   {        
    paused = true;
    instance_activate_object(obj_pause_object);
    
    for (i = 0; i < array_length_1d(obj_pause_object.button_array); i ++)
        {
         instance_activate_object(obj_pause_object.button_array[i]);
        }
    for (i = 0; i < array_length_1d(button_array); i ++)
        {
         instance_destroy(button_array[i]);
        }
    instance_destroy(obj_controls_menu_object);
    instance_destroy();
   }
else
   {
    room_goto(rm_main_menu);
    for (i = 0; i < array_length_1d(button_array); i ++)
        {
         instance_destroy(button_array[i]);
        }
    instance_destroy(obj_controls_menu_object);
    instance_destroy();
   }
