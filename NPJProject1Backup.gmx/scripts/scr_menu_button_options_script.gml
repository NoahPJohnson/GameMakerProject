///Open options menu
show_debug_message("Open the Controls");
instance_create(x,y, obj_controls_menu_object);
instance_deactivate_all(false);
instance_activate_object(obj_controls_menu_object);
for (i = 0; i < array_length_1d(obj_controls_menu_object.button_array); i++)
    {
     instance_activate_object(obj_controls_menu_object.button_array[i]);
    }

