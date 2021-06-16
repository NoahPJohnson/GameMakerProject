///scr_checkpoint_load()
if (obj_checkpoint.checkpoint_active == true)
   {
    obj_checkpoint_manager.checkpoint_active = true;

    obj_checkpoint_manager.player_checkpoint_x = obj_checkpoint.player_x;
    obj_checkpoint_manager.player_checkpoint_y = obj_checkpoint.player_y;
    
    for (i = 0; i < array_length_1d(obj_checkpoint.active_enemy_x_array); i++)
        {
         obj_checkpoint_manager.active_enemies_type_array[i] = obj_checkpoint.active_enemy_type_array[i];
         obj_checkpoint_manager.active_enemies_location_x_array[i] = obj_checkpoint.active_enemy_x_array[i];
         obj_checkpoint_manager.active_enemies_location_y_array[i] = obj_checkpoint.active_enemy_y_array[i];
        }
    show_debug_message("Checkpoint Loaded.");
   }
else
   {
    show_debug_message("Did NOT load checkpoint.");
   }



