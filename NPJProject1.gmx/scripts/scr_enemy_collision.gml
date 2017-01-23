//Horizontal Collision
if (place_meeting(x+hspd,y,obj_enemy))
   {
    enemy_meeting = instance_place(x+hspd,y, obj_enemy)
    if (enemy_meeting.state != e_state.crash)
       {
        while (!place_meeting(x+sign(hspd),y,enemy_meeting))
              {
               x += sign(hspd);
              } 
        hspd = 0;
       }
   }

//Horizontal Collision with Player
/*if (place_meeting(x+hspd,y,obj_player))
   {
    player_meeting = instance_place(x+hspd,y, obj_player)
    if (player_meeting.state != states.sliding)
       {
        while (!place_meeting(x+sign(hspd),y,player_meeting))
              {
               x += sign(hspd);
              } 
        hspd = 0;
       }
   }*/
   
//Vertical Collision
if (place_meeting(x,y+vspd,obj_enemy))
   {
    enemy_meeting = instance_place(x,y+vspd, obj_enemy)
    if (enemy_meeting.state != e_state.crash)
       {
        while (!place_meeting(x,y+sign(vspd),enemy_meeting))
              {
               y += sign(vspd);
              } 
        vspd = 0;
       }
   }
   
//Vertical Collision with Player
/*if (place_meeting(x,y+vspd,obj_player))
   {
    player_meeting = instance_place(x,y+vspd, obj_player)
    if (player_meeting.state != states.sliding)
       {
        while (!place_meeting(x,y+sign(vspd),player_meeting))
              {
               y += sign(vspd);
              } 
        vspd = 0;
       }
   }*/

/*//If player and enemy are occupying the same space
if (place_meeting(x, y, obj_player))
   {
    player_meeting = instance_place(x,y, obj_player)
    //sprite_index = spr_player_charging;
    if (player_meeting.state != states.sliding)
       {
        x = x-(player_meeting.x-x);
        y = y-(player_meeting.y-y);
       }
   }*/
