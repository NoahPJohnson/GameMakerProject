///Swing in the Air
if (swinging = false && recovery = false && !place_meeting(x, y+1, obj_boundary))
   {
    if (keyboard_check_pressed(vk_numpad2))
       { 
        swinging = true;
        if (alarm[5] = -1)
           {
            alarm[5] = room_speed * (4/60);
           }
       }
   }
