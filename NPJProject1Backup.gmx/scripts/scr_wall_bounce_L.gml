if (place_meeting(x,y-32,obj_boundary) && !place_meeting(x, y, obj_enemy))
   {
    if (obj_player.alarm[8] == -1)
       {
        obj_player.alarm[8] = room_speed * (18/60);
       }
        //obj_player.wallBounce = true;
        obj_player.hitdir = 1;
        obj_player.knock_force = 12;
        //show_debug_message("left spike hit. put player in knockback state. state = " + string(obj_player.state));
        obj_player.state = states.knockback;
   }
