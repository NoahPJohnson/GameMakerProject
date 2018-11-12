//Boss Movement Script

speed = 0;
direction = 0;
   
vspd = (min(7, vspd + grv));
if (firing == false)
   {
    hspd = dir * chsSpeed;
   }   
   
if (dir == -1)
   {
    image_xscale = -1;
   }
else if (dir == 1)
   {
    image_xscale = 1;
   }
   
//Melee Attack
//scr_enemy_melee();
  
//Valid Target
//scr_enemy_targeted();
   
//Hit by the Bat   
//scr_hit_by_bat();

//Hit by a Projectile
//scr_hit_by_projectile();

//Collision
scr_collision();
