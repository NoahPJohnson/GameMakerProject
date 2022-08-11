///Camera Lock On
//Height = 750 :: 768
//Width = 1000 :: 1024
//following player - h = 600, v = 256

key_lock_on_press = keyboard_check_pressed(ord("L")) || keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0, gp_shoulderl);
key_lock_on_release = keyboard_check_released(ord("L")) || keyboard_check_released(ord("F")) || gamepad_button_check_released(0, gp_shoulderl);;
key_lock_on_hold = keyboard_check(ord("L")) || keyboard_check(ord("F")) || gamepad_button_check(0, gp_shoulderl);;

//Disable lock on
if (key_lock_on_release)
   {
    state = camera_state.neutral;
   }

//view_hview[0] = 900;
//view_wview[0] = 1150;
camera_field_x_left = view_xview[0];
camera_field_x_right = view_xview[0] + view_wview[0];
camera_field_y_top = view_yview[0];
camera_field_y_bottom = view_yview[0] + view_hview[0];
camera_center_x = (camera_field_x_right + camera_field_x_left)/2;
camera_center_y = (camera_field_y_top + camera_field_y_bottom)/2;
on_screen_enemy_count = 0;
average_enemy_x = 0;
average_enemy_y = 0;
with (obj_enemy)
     {
      if (state != e_state.crash)
         {
          //if (x < obj_camera_control.camera_field_x_right && x > obj_camera_control.camera_field_x_left && y < obj_camera_control.camera_field_y_bottom && y > obj_camera_control.camera_field_y_top)
          if (x > obj_player.x-700 && x < obj_player.x+700 && y > obj_player.y-500 && y < obj_player.y+500)   
             {
              obj_camera_control.enemy_x_array[obj_camera_control.on_screen_enemy_count] = x;
              obj_camera_control.enemy_y_array[obj_camera_control.on_screen_enemy_count] = y;
              obj_camera_control.on_screen_enemy_count += 1;
             }
         }
     }
for (i = 0; i < on_screen_enemy_count; i +=1)
    {
     average_enemy_x += enemy_x_array[i];
     average_enemy_y += enemy_y_array[i];
    }
if (on_screen_enemy_count > 0)
   {
        view_object[0] = noone;
        average_enemy_x = average_enemy_x/on_screen_enemy_count;
        average_enemy_y = average_enemy_y/on_screen_enemy_count;
        target_x = (obj_player.x + average_enemy_x)/2;
        target_y = (obj_player.y + average_enemy_y)/2;
        camera_delta_x = (3+(abs(camera_center_x-target_x)/20));
        camera_delta_y = (3+(abs(camera_center_y-target_y)/20));
        if (camera_center_y-(view_wview[0]/2)-10-camera_delta_x >= 0)
        {
            if (camera_center_x > (target_x-10))
               {
                view_xview[0] -= camera_delta_x * ((60/1000000) * delta_time);
               }
        }
        if (camera_center_x+(view_wview[0]/2)+10+camera_delta_x <= room_width )
        {
            if (camera_center_x < (target_x+10))
               {
                view_xview[0] += camera_delta_x * ((60/1000000) * delta_time);
               }
       }
       if (camera_center_y-(view_hview[0]/2)-10-camera_delta_y >= 0)
       {
            if (camera_center_y > (target_y-10))
               {
                view_yview[0] -= camera_delta_y * ((60/1000000) * delta_time);
               }
       }
       if (camera_center_y+(view_hview[0]/2)+10+(camera_delta_y) <= room_height)
       {
            if (camera_center_y < (target_y+10))
               {
                view_yview[0] += camera_delta_y * ((60/1000000) * delta_time);
               }
       }
   }
else
   {
    view_object[0] = obj_player;
   }
