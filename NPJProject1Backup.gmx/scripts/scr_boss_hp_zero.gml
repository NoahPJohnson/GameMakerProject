if (hp < 1)
   {
    instance_destroy(weakpoint);
    instance_destroy(appendage);
    instance_destroy(blocker);
    show_debug_message("Time to end the level.");
    instance_create(x,y, obj_level_complete_menu_object);
    obj_level_complete_menu_object.saved_player_score = obj_scoring_manager.runs;
    //scr_checkpoint_load();
    //scr_checkpoint_use();
    instance_deactivate_all(false);
    instance_activate_object(obj_checkpoint_manager);
    instance_activate_object(obj_level_complete_menu_object);
    for (i = 0; i < array_length_1d(obj_level_complete_menu_object.button_array); i++)
        {
         instance_activate_object(obj_level_complete_menu_object.button_array[i]);
        }
    //room_goto(rm_Game_Over)
   }
