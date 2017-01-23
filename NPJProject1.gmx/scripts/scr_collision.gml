///Collision
//Going Down Slope
if (!place_meeting(x+sign(hspd),y+1,obj_boundary && jumping = false)) // && place_meeting(x+sign(hspd),y+2,obj_boundary))
   {
    y_adj = 1;
    while (!place_meeting(x+hspd,y+y_adj,obj_boundary) && y_adj <= abs(2*hspd) && jumping = false)
          {
           y_adj += 1;
          }
    if (place_meeting(x+hspd,y+y_adj,obj_boundary) && jumping = false && !place_meeting(x+hspd,y, obj_boundary))
       {
        y += y_adj; 
       }
   }
   
//Horizontal Collision
if (place_meeting(x+hspd,y,obj_boundary))
   {
    y_adj = 0;
    while (place_meeting(x+hspd,y-y_adj, obj_boundary) && y_adj <= abs(slope_mod*hspd))
          {
           y_adj += 1;
          }
    if (place_meeting(x+hspd,y-y_adj,obj_boundary))
       {
        while (!place_meeting(x+sign(hspd),y,obj_boundary))
              {
               x += sign(hspd);
              } 
        hspd = 0;
       }
    //Going Up Slope
    else
       {
        y -= y_adj;
       }
   }
x += hspd;




/*if (place_meeting(x-sign(hspd)*(sprite_width/2),y+2,obj_boundary_slope))
//if (!place_meeting(x+sign(hspd),y+1,obj_boundary) && place_meeting(x+sign(hspd),y+2,obj_boundary))
   {
    //sprite_index = spr_player_charging;
    //move_contact_solid(270,16)
    if (!place_meeting(x+hspd,y+1,obj_boundary))
       {
        y += abs(hspd);
       }
   }
*/


//Vertical Collision
if (place_meeting(x,y+vspd,obj_boundary))
   {
    while (!place_meeting(x,y+sign(vspd),obj_boundary))
          {
           y += sign(vspd);
          }  
    vspd = 0;
   }   
y += vspd; 

