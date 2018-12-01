///scr_create_projectile(projectile_speed,projectile_direction,location_x,location_y,projectile)
projectile_speed = argument0;
projectile_direction = argument1;
location_x = argument2;
location_y = argument3;
projectile = argument4;
var p_speed = projectile_speed;
var p_direction = projectile_direction;
spawned_projectile = instance_create(location_x,location_y,projectile);
with (spawned_projectile)
     {
      speed = p_speed;
      direction = p_direction;
     }

