///Projectile Struck
struck = true;
//hp = 1;
projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == false)
       {
        projectile_meeting.state = proj_state.destroyed
        hp -= 1;
       } 
   }

vspeed += 0.8;

//Collsion with Wall
    if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop))
       {
        speed = 0;
        alarm[2] = 1;
       }
       
//Collision with Enemy
if (place_meeting(x, y, obj_enemy))
   {
    speed = 0;
    alarm[2] = 1;
   }
   
if (hp < 1)
   {
    alarm[2] = 1;
   }
      
