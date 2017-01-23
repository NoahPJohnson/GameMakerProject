///Knockback
dashing = false;
jumping = true;

if (iframes = false && wallBounce = false)
   {
    hspd = knock_force * hitdir;
    vspd = -knock_force + 1;
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

   
