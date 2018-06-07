///Struck Grenade

struck = true;
//hp = 2;

vspeed += 0.8;

//Collsion with Wall
scr_collision_bounce();
   
if (hp < 1)
   {
    instance_destroy();
   }
