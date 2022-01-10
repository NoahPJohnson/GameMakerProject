///scr_checkpoint_create()
checkpoint_active = true;

enemy_index = 0;
with (obj_enemy)
     {
      if (state != e_state.crash || object_index == obj_prop)
         {
          other.active_enemy_type_array[other.enemy_index] = object_index;
          other.active_enemy_x_array[other.enemy_index] = x;
          other.active_enemy_y_array[other.enemy_index] = y;
          other.enemy_index += 1;
          //show_debug_message("I am: " + object_get_name(self) + " index = " + obj_checkpoint.enemy_index)
         }
     }
 
saved_score = obj_scoring_manager.runs;


