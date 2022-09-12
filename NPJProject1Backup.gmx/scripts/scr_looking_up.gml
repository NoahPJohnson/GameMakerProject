///Looking Up /The Launcher

key_U = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu) || gamepad_button_check_pressed(0, gp_shoulderr) || (gamepad_axis_value(0, gp_axislv) < -0.60 && stick_moved_up == false);
key_U_held = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu) || gamepad_button_check(0, gp_shoulderr) || (gamepad_axis_value(0, gp_axislv) < -0.60);
key_U_released = keyboard_check_released(ord("W")) || gamepad_button_check_released(0, gp_padu) || gamepad_button_check_released(0, gp_shoulderr) || (gamepad_axis_value(0, gp_axislv) >= -0.60 && stick_moved_up == true);

if (gamepad_axis_value(0, gp_axislv) < -0.60 && stick_moved_up == false)
{
    stick_moved_up = true;
}
else if (gamepad_axis_value(0, gp_axislv) >= -0.60 && stick_moved_up == true)
{
    stick_moved_up = false;
}

if (place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy))
   {
    if (swinging == false && recovery == false && crouching == false && up == false)
       { 
        if (key_U_held)
           {
            up = true;
            crouching = false;
            mspd = mspd_normal;
            if (charging = true)
               {
                mspd = 0;
               }
            if (chargeOne = true)
               {
                mspd = 0;
               }
            if (chargeTwo = true)
               {
                mspd = 0;
               }
           }
       }
   }
else
   {
    up = false;
   }
if (swinging = false && key_U_released)
   {
    up = false;
   }   
