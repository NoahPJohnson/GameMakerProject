///Camera Neutral

key_lock_on_press = keyboard_check_pressed(ord("L")) || keyboard_check_pressed(ord("F"));
key_lock_on_release = keyboard_check_released(ord("L")) || keyboard_check_released(ord("F"));
key_lock_on_hold = keyboard_check(ord("L")) || keyboard_check(ord("F"));

camera_field_x_left = view_xview[0];
camera_field_x_right = view_xview[0] + view_wview[0];
camera_field_y_top = view_yview[0];
camera_field_y_bottom = view_yview[0] + view_hview[0];
camera_center_x = (camera_field_x_right + camera_field_x_left)/2;
camera_center_y = (camera_field_y_top + camera_field_y_bottom)/2;

//Enable lock on
if (key_lock_on_release)
{
    state = camera_state.lock_on;
}

if (view_object[0] != obj_player)
{   
    view_object[0] = obj_player;
}

if (abs(view_object[0].x - camera_center_x) > view_wview[0] || abs(view_object[0].y - camera_center_y) > view_hview[0])
{
    view_xview[0] = view_object[0].x - (view_wview[0]/2);
    view_yview[0] = view_object[0].y - (view_hview[0]/2);
}
