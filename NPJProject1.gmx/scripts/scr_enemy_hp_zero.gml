///HP = 0
if (hp < 1)
   {
    if (instance_exists(melee_hitbox))
       {   
        melee_hitbox.alarm[0] = 1;
       }
    if (alarm[3] = -1)
       {
        alarm[3] = room_speed * (180/60);
       }
    hitstun = false;
    alarm[1] = -1;
    state = e_state.crash
   }
