///scr_checkpoint_use()
//room_goto(rm_test2);
    show_debug_message("USE THE CHECKPOINT!");
    //show_debug_message("Where is the player? " + string(obj_player.x));
    if (instance_exists(obj_player))
       {
        obj_player.x = player_checkpoint_x;
        obj_player.y = player_checkpoint_y;
       }
    else
       {
        instance_create(player_checkpoint_x,player_checkpoint_y,obj_player);
       }
    if (instance_exists(obj_enemy))
       {
        with (obj_enemy)
             {
              instance_destroy();
             }
       }
    for (i = 0; i < array_length_1d(active_enemies_location_x_array); i++)
        {
         if (active_enemies_type_array[i] != noone)
            {
             spawned_enemy = noone;
             spawned_enemy = instance_create(active_enemies_location_x_array[i], active_enemies_location_y_array[i], active_enemies_type_array[i]);
             spawned_enemy.image_angle = active_enemies_angle_array[i];
            }
        }
obj_scoring_manager.runs = saved_score;
    



