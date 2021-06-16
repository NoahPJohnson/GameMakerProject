///Collision   
/*if (state != states.sliding)
{
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
}
*/
