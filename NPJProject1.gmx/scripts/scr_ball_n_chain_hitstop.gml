///Projectile Hitstop
speed = 0;
direction = 0;

if (damage_hitstop == false)
   {
    show_debug_message("BALL is not in damage hitstop.");
    if (hitstop == false)
       {
        for (i = 0; i < 5; i++)
            {
             if (i != 3)
                {
                 alarm_array[i] = alarm[i];
                 //show_debug_message("ALARM ARRAY: " + string(i) + " = " + string(alarm[i]));
                 alarm[i] = -1;
                }
            }
        hitstop = true;
       }
   }
else
   {
    alarm[0] = -1;
    alarm[1] = -1;
    //alarm[2] = -1;
   }
