///Collision
/*if (place_meeting(x,y,obj_player) && object_index == obj_enemy && distance_to_object(obj_player) < 600)
   {
    show_debug_message("*Normal Collision Clipping before ANY");
   }*/
/*if (place_meeting(x,y,obj_enemy) && object_index == obj_player)
   {
    show_debug_message("*Normal Collision Clipping before ANY");
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
       }
    else if (place_meeting(x+hspd,y-y_adj,obj_enemy))
       {
        y_adj = 0;
       }
    else if (place_meeting(x+hspd,y-y_adj,obj_player))
       {
        y_adj = 0;
       }
    //Going Up Slope
    else 
       {
        y -= y_adj;
       }
    if (place_meeting(x+hspd,y,obj_enemy))
       {
        enemy_collision = instance_place(x+hspd,y,obj_enemy);
        if (!place_meeting(x,y,obj_enemy) || enemy_collision.slide_through == false)
           {
            if (state != states.sliding || enemy_collision.slide_through == false)
               {
                while (!place_meeting(x+sign(hspd),y,obj_enemy))
                      {
                       x += sign(hspd);
                      }
                hspd = 0;
               }
           }
       }    
    if (place_meeting(x+hspd,y,obj_player) && !place_meeting(x,y,obj_player))
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




/*if (place_meeting(x,y,obj_player) && object_index == obj_enemy && distance_to_object(obj_player) < 600)
   {
    show_debug_message("*Normal Collision Clipping before VERTICAL");
   }*/
/*if (place_meeting(x,y,obj_enemy) && object_index == obj_player)
   {
    show_debug_message("*Normal Collision Clipping before VERTICAL");
   }*/

//Vertical Collision
if (place_meeting(x,y+vspd,obj_enemy))
   {
    enemy_collision = instance_place(x,y+vspd,obj_enemy);
    if (!place_meeting(x,y,obj_enemy) || enemy_collision.slide_through == false)
       {
        if (state != states.sliding || enemy_collision.slide_through == false)
           {
            enemy_collision = instance_place(x,y+vspd, obj_enemy);
            while (!place_meeting(x,y+sign(vspd),obj_enemy))
                  {
                   y += sign(vspd);
                  }
            vspd = 0;
    
            show_debug_message("Vertical Collision with enemy. Distance = " + string(distance_to_object(enemy_collision)));
           }
       }       
    
   }    
if (place_meeting(x,y+vspd,obj_player) && !place_meeting(x,y,obj_player))
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
        y+=(y_adj-1)
       }
   }
   
/*if (place_meeting(x,y,obj_boundary))
   {
    show_debug_message("*Normal Collision Clipping after");
   }*/
/*if (place_meeting(x,y,obj_enemy) && object_index == obj_player)
   {
    show_debug_message("*Normal Collision Clipping after");
   }*/

