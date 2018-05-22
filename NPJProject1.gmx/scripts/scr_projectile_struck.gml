///Projectile Struck
struck = true;
hp = 2;
projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == false)
       {
        projectile_meeting.state = proj_state.destroyed
        hp -= 1;
       } 
   }

//Collsion with Wall
if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop))
   {
    instance_destroy();
   }
   
if (hp < 1)
   {
    instance_destroy();
   }
      
