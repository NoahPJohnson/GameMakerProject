camera_field_x_left = view_xview[0];
camera_field_x_right = view_xview[0] + view_wview[0];
camera_field_y_top = view_yview[0];
camera_field_y_bottom = view_yview[0] + view_hview[0];
instance_deactivate_object(obj_enemy);
instance_deactivate_object(obj_powerup_health);
instance_deactivate_object(obj_powerup_big_bat);
instance_deactivate_object(obj_powerup_invincibility);
instance_deactivate_object(obj_powerup_infinite_stamina);
instance_deactivate_object(obj_powerup_charge);

instance_activate_region(camera_field_x_left-240, camera_field_y_top-240, view_wview[0]+480, view_hview[0]+480, true);
//obj_boundary.visible = false;

with(obj_enemy_spawner_barrier)
{
    if (barrier_active == false && instance_exists(self))
    {
        instance_deactivate_object(self);
    }
    else if (barrier_active == true && !instance_exists(self))
    {
        instance_activate_object(self);
    }
}


