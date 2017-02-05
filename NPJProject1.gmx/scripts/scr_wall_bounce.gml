if (place_meeting(x,y-32,obj_boundary) || place_meeting(x, y, obj_enemy))
   {
    if (obj_player.alarm[8] == -1)
       {
        obj_player.alarm[8] = 15;
       }
        //obj_player.wallBounce = true;
        obj_player.hitdir = -1;
        obj_player.knock_force = 12;
        obj_player.state = states.knockback;
   }
