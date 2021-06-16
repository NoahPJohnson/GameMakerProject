if (sp < sp_max && sliding == false && !instance_exists(obj_bunt_bat))
   {
    sp += room_speed * (sp_regain_rate/60);
    if (sp >= 10 && sp_regain_rate < 0.7)
       {
        sp_regain_rate += room_speed * (.01/60);
       } 
   }
else
   {
    sp_regain_rate = 0.1;
   }
if (sp < 0)
   {
    sp = 0;
   }
if (sp > sp_max)
   {
    sp = sp_max;
   }
if (infinite_stamina_active == true)
   {
    sp = sp_max;
   }
/*if (sp < 10 && sp_regain_rate > 0.1)
   {
    sp_regain_rate = 0.1;
   }
else if (sp >= 10 && sp_regain_rate < 0.6)
   {
    sp_regain_rate += room_speed * (.05/60);
   }*/      
