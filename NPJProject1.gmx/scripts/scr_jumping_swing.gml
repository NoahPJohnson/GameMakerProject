///Swing in the Air
if (swinging = false && recovery = false && !place_meeting(x, y+1, obj_boundary) && !place_meeting(x, y+1, obj_enemy))
   {
    if (keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift))
       { 
        swinging = true;
        if (alarm[5] = -1)
           {
            alarm[5] = room_speed * (6/60);
           }
       }
   }
