///Start the game
show_debug_message("START Game!");
room_goto(rm_test2);
show_debug_message("number of checkpoint managers: " + string(instance_number(obj_checkpoint_manager)));
show_debug_message("number of music managers: " + string(instance_number(obj_music_sfx_manager)));
obj_checkpoint_manager.checkpoint_active = false;
instance_destroy();
