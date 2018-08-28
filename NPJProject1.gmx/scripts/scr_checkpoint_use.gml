///scr_checkpoint_use()
//room_goto(rm_test2);
    show_debug_message("USE THE CHECKPOINT!");
    //show_debug_message("Where is the player? " + string(obj_player.x));
    obj_player.x = player_checkpoint_x;
    obj_player.y = player_checkpoint_y;
   
    with (obj_enemy)
         {
          instance_destroy();
         }
         
    for (i = 0; i < array_length_1d(active_enemies_location_x_array); i++)
        {
         instance_create(active_enemies_location_x_array[i], active_enemies_location_y_array[i], active_enemies_type_array[i]);
        }
    



