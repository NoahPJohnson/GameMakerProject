///Reversed state
struck = true;
stop = false;
if (!place_meeting(x,y+vspeed,obj_boundary))
   {
    //vspeed += 0.9;
    motion_add(270, 0.9);
   }

if (enemy_parent != noone)
   {
    if (distance_to_object(enemy_parent) > 120)
       {
        direction = point_direction(x,y,enemy_parent.x,enemy_parent.y);
       }
   }

scr_ball_hit_by_bat();
   
scr_ball_collision_bounce();
