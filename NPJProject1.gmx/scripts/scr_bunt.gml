///Bunting
if (crouching == true && sliding == false)
   {
    if (key_Swing_Held && !instance_exists(obj_bunt_bat) && sp > 75)
       {
        if (right == true)
           {
            instance_create(x,y+16,obj_bunt_bat);
           }
        else if (right == false)
           {
            instance_create(x-32,y+16,obj_bunt_bat);
           }
       }
    else if (key_Swing_Released)
       {
        instance_destroy(obj_bunt_bat);
       }
   }
else
   {
    if (instance_exists(obj_bunt_bat))
       {
        instance_destroy(obj_bunt_bat);
       }
   }

