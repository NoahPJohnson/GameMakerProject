///scr_checkpoint_create()
checkpoint_active = true;

enemy_index = 0;
with (obj_enemy)
     {
      if (state != e_state.crash)
         {
          obj_checkpoint.active_enemy_type_array[obj_checkpoint.enemy_index] = object_index;
          obj_checkpoint.active_enemy_x_array[obj_checkpoint.enemy_index] = x;
          obj_checkpoint.active_enemy_y_array[obj_checkpoint.enemy_index] = y;
          obj_checkpoint.enemy_index += 1;
          //show_debug_message("I am: " + object_get_name(self) + " index = " + obj_checkpoint.enemy_index)
         }
     } 



