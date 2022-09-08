///Knockback
dashing = false;
jumping = true;

if (wallBounce == false)
{
    hspd = (knock_force+1) * hitdir;
    vspd = -(knock_force);
    //show_debug_message("knock force = " + string(knock_force) + " hspd = " + string(hspd) + " vspd = " + string(vspd));
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

   
