///Camera Neutral

key_lock_on_press = keyboard_check_pressed(ord("L")) || keyboard_check_pressed(ord("F"));
key_lock_on_release = keyboard_check_released(ord("L")) || keyboard_check_released(ord("F"));
key_lock_on_hold = keyboard_check(ord("L")) || keyboard_check(ord("F"));

//Disable lock on
if (key_lock_on_release)
   {
    state = camera_state.lock_on;
   }
   
view_object[0] = obj_player;
