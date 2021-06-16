///Resume the game
//show_debug_message("Resume Game!")
obj_pause_object.paused = false;
for (i = 0; i < array_length_1d(obj_pause_object.button_array); i ++)
    {
     instance_destroy(obj_pause_object.button_array[i]);
    }
instance_activate_all();
