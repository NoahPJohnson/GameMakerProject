///Projectile Struck
struck = true;
//hp = 2;
projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == false)
       {
        projectile_meeting.state = proj_state.destroyed
        hp -= 1;
       } 
   }

if (bunted == true)
   {
    //vspeed += 0.9;
    motion_add(270, 0.9);
   }

//Collsion with Wall
if (object_index != obj_projectile_ricochet)
   {
    if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop))
       {
        if (!place_meeting(x,y,obj_boss_canister))
           {
            instance_destroy();
           }
       }
   }
else
   {
    scr_collision_ricochet();
   }
   
if (hp < 1)
   {
    instance_destroy();
   }
      
