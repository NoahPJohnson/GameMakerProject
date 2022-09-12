///HP = 0
if (hp < 1)
   {
    hp = 0;
    instance_create(x,y, obj_game_over_menu_object);
    scr_checkpoint_load();
    //scr_checkpoint_use();
    instance_deactivate_all(false);
    instance_activate_object(obj_checkpoint_manager);
    instance_activate_object(obj_music_sfx_manager);
    instance_activate_object(obj_game_over_menu_object);
    for (i = 0; i < array_length_1d(obj_game_over_menu_object.button_array); i++)
        {
         instance_activate_object(obj_game_over_menu_object.button_array[i]);
        }
    //room_goto(rm_Game_Over)
   }
