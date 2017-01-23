if (place_meeting(x,y,obj_boundary) && obj_player.key_J_held == true)
   {
    if (obj_player.alarm[8] == -1)
       {
        obj_player.alarm[8] = 15;
       }
        //obj_player.wallBounce = true;
        obj_player.hitdir = 1;
        obj_player.knock_force = 12;
        obj_player.state = states.knockback;
       }
