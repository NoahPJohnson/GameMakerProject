///Knockback
dashing = false;
jumping = true;

if (wallBounce = false)
   {
    hspd = (knock_force+1) * hitdir;
    vspd = -(knock_force);
    wallBounce = true;
   }
else
   {
    //Gravity   
    if (vspd < 10) 
       {
        vspd += grv;
       }
   }
      
//Stamina
scr_stamina();   
   
//Collision   
scr_collision();

   
