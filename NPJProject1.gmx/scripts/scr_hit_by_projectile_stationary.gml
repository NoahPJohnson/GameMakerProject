projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == true)
       {
        hp -= .5;
        projectile_meeting.state = proj_state.destroyed
       }
   }         
