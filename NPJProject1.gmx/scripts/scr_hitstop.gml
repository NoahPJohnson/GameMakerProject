///Hitstop State
if (damage_hitstop == false)
   {
    show_debug_message("Not in damage hitstop.");
    if (hitstop == false)
       {
    
        for (i = 0; i < 9; i++)
            {
             alarm_array[i] = alarm[i];
             //show_debug_message("ALARM ARRAY: " + string(i) + " = " + string(alarm[i]));
             alarm[i] = -1;
            }
        hitstop = true;
       }
   }
else
   {
    
    speed = 0;
    direction = 0;
    show_debug_message("IN damage hitstop. Speed: " + string(speed) + " name is " + string(id));
    alarm[0] = -1;
    alarm[1] = -1;
    alarm[2] = -1;
    alarm[7] = -1;
    alarm[8] = -1;
   }
   
//Collision
scr_collision_bounce();





