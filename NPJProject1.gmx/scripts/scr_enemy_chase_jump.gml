///Jumping Enemy
if (jumping == true)
   {
    if ((place_meeting(x,y+1, obj_boundary) || place_meeting(x,y+1,obj_player)) && jumped = true)
       {
        hspd = 0;
        chsSpeed = 0;
        //sprite_index = spr_player_charging;
        if (alarm[6] = -1)
           {
            alarm[6] = room_speed * (60/60);
           }
       }   
    if (alarm[5] = -1)
       {
        alarm[5] = room_speed * (94/60);
       }
   }
if (distance_to_object(obj_player) < 128)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (jumping = true)
       {
        if (place_meeting(x, y+1, obj_boundary) && jumped = false)
           {
            alarm[5] = 1;
           }
       }
   }
