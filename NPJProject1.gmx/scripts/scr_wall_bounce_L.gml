if (place_meeting(x,y-32,obj_boundary) || place_meeting(x, y, obj_enemy))
   {
    if (obj_player.alarm[8] == -1)
       {
        obj_player.alarm[8] = room_speed * (18/60);
       }
    if (obj_player.alarm[7] == -1)
       {
        obj_player.alarm[7] = room_speed * (20/60);
       }
        //obj_player.wallBounce = true;
        obj_player.iframes = true;
        obj_player.hitdir = 1;
        obj_player.knock_force = 12;
        obj_player.state = states.knockback;
       }
