if (damage_hitstop == false)
   {
    if (hitstop == false)
       {
        show_debug_message("Player is in non damage hitstop for: " + string(alarm[11]) + " frames.")
        for (i = 0; i < 11; i++)
            {
             alarm_array[i] = alarm[i];
             //show_debug_message("player alarm array: " + string(i) + " = " + string(alarm[i]));
             alarm[i] = -1;
            }
        hitstop = true;
       }
   }
else
   {
    show_debug_message("Player is in DAMAGE HITSTOP.");
   }

//hspd = 0;
//vspd = 0;
//Collision
//scr_collision();
