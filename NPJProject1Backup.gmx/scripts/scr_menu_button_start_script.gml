///Start the game
show_debug_message("START Game!");
room_goto(rm_Level_2);
obj_checkpoint_manager.checkpoint_active = false;
instance_destroy();
