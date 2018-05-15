projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == true)
       {
        speed = 7;       
        if (place_meeting(x,y+1,obj_boundary) && direction > 180 && direction < 360)
           {
            direction = -projectile_meeting.direction;
           }
        else
           {
            direction = projectile_meeting.direction;
           }
        hp -= .5;
        projectile_meeting.state = proj_state.destroyed
        if (state != e_state.crash)
           {
            alarm[1] = room_speed * (13/60);
            hitstun = true;
            state = e_state.hitstun;
           }
       }
   }         
