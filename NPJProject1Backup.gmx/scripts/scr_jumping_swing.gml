///Swing in the Air
if (swinging = false && recovery = false && !place_meeting(x, y+1, obj_boundary) && !place_meeting(x, y+1, obj_enemy))
   {
    if (keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(0, gp_face4))
       { 
        swinging = true;
        if (alarm[5] = -1)
           {
            alarm[5] = room_speed * (6/60);
           }
       }
   }
