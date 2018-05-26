if (sp < sp_max && sliding == false && !instance_exists(obj_bunt_bat))
   {
    sp += room_speed * (0.6/60);
   }
if (sp < 0)
   {
    sp = 0;
   }
if (sp > sp_max)
   {
    sp = sp_max;
   }      
