///Projectile Struck
struck = true;
hp = 2;
projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck = false)
       {
        projectile_meeting.state = proj_state.destroyed
        hp -= 1;
       } 
   }
   
if (hp < 1)
   {
    instance_destroy();
   }
      
