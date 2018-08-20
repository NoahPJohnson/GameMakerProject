///Collision
/*if (place_meeting(x,y,obj_player) && object_index == obj_enemy && distance_to_object(obj_player) < 600)
   {
    show_debug_message("Normal Collision Clipping before ANY");
   }*/


//Horizontal Collision
/*if (place_meeting(x,y,obj_boundary) && object_index == obj_enemy && distance_to_object(obj_player) < 600)
   {
    show_debug_message("Normal Collision Clipping before horizontal");
   }*/
if (place_meeting(x+hspd,y,obj_boundary) || place_meeting(x+hspd,y,obj_enemy) || place_meeting(x+hspd,y,obj_player))
   {
    y_adj = 0;
    while (place_meeting(x+hspd,y-y_adj, obj_boundary) && y_adj <= abs(slope_mod*hspd))
          {
           y_adj += 1;
          }
    if (place_meeting(x+hspd,y-y_adj,obj_boundary))
       {
        y_adj = 0;
        /*while (!place_meeting(x+sign(hspd),y-1,obj_boundary))
              {
               x += sign(hspd);
               y -= 1;
              } 
        hspd = 0;*/
       }
    else if (place_meeting(x+hspd,y-y_adj,obj_enemy))
       {
        y_adj = 0;
        /*enemy_collision = instance_place(x+hspd,y-y_adj, obj_enemy);
        while (!place_meeting(x+sign(hspd),y-y_adj,enemy_collision))
              {
               x += sign(hspd);
               y -= 1;
              }*/ 
        //hspd = 0;
       }
    else if (place_meeting(x+hspd,y-y_adj,obj_player))
       {
        y_adj = 0;
        /*while (!place_meeting(x+sign(hspd),y-y_adj,obj_player))
              {
               x += sign(hspd);
               y -= 1;
              }*/ 
        //hspd = 0;
       }
    //Going Up Slope
    else 
       {
        y -= y_adj;
       }
    if (place_meeting(x+hspd,y,obj_enemy))
       {
        if (state != states.sliding)
           {
            while (!place_meeting(x+sign(hspd),y,obj_enemy))
                  {
                   x += sign(hspd);
                  }
            hspd = 0;
           }
       }    
    if (place_meeting(x+hspd,y-40,obj_player))
       {
        player_collision = instance_place(x+hspd,y, obj_player);
        if (player_collision.state != states.sliding)
           {
            while (!place_meeting(x+sign(hspd),y,obj_player))
                  {
                   x += sign(hspd);
                  }
            hspd = 0;
           }   
       }
    if (place_meeting(x+hspd,y,obj_boundary))
       {
        while (!place_meeting(x+sign(hspd),y,obj_boundary))
              {
               x += sign(hspd);
              }
        hspd = 0;
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
/*if (place_meeting(x,y,obj_player) && object_index == obj_enemy && distance_to_object(obj_player) < 600)
   {
    show_debug_message("Normal Collision Clipping before VERTICAL");
   }*/

//Vertical Collision
if (place_meeting(x,y+vspd,obj_enemy))
   {
    if (state != states.sliding)
       {
        while (!place_meeting(x,y+sign(vspd),obj_enemy))
              {
               y += sign(vspd);
               //sprite_index = spr_enemy_jump;
              }
        vspd = 0;
       }       
    
   }    
if (place_meeting(x,y+vspd,obj_player))
   {
    player_collision = instance_place(x,y+vspd, obj_player);
    if (player_collision.state != states.sliding)
       {
        while (!place_meeting(x,y+sign(vspd),obj_player))
              {
               y += sign(vspd);
              }
        vspd = 0;
       }   
   }
if (place_meeting(x,y+vspd,obj_boundary))
   {
    while (!place_meeting(x,y+sign(vspd),obj_boundary))
          {
           y += sign(vspd);
          }  
    vspd = 0;
   }   
    
y += vspd; 

//Going Down Slope
if ((!place_meeting(x,y+1,obj_boundary) && jumping = false))
   {
    y_adj = 1;
    while (!place_meeting(x,y+y_adj,obj_boundary) && y_adj <= abs(2*hspd) && jumping = false)
          {
           y_adj += 1;
          }
    if (place_meeting(x,y+y_adj,obj_boundary) && jumping = false && !place_meeting(x+hspd,y, obj_boundary) && !place_meeting(x+hspd,y, obj_enemy) && !place_meeting(x+hspd,y, obj_player))
       {
        //show_debug_message("Going down slope.");
        y+=(y_adj-1)
       }
   }
   
/*if (place_meeting(x,y,obj_boundary))
   {
    show_debug_message("Normal Collision Clipping after");
   }*/

