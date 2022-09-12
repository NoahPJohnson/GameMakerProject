///Open options menu
show_debug_message("Open the Controls");
instance_create(x,y, obj_controls_pause_menu_object);
instance_deactivate_all(false);
instance_activate_object(obj_controls_pause_menu_object);
instance_activate_object(obj_checkpoint_manager);
instance_activate_object(obj_music_sfx_manager);
for (i = 0; i < array_length_1d(obj_controls_pause_menu_object.button_array); i++)
{
     instance_activate_object(obj_controls_pause_menu_object.button_array[i]);
}

