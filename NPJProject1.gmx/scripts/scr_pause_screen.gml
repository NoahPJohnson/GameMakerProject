key_pause = keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_escape);
if (key_pause)
   {
    if (paused == false)
       {
        paused = true;
        instance_deactivate_all(true);
       }
    else
       {
        paused = false;
        instance_activate_all();
       }
   }
