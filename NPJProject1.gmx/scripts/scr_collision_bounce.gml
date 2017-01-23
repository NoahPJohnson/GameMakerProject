///Collision
//Horizontal Collision
if (place_meeting(x+hspeed,y,obj_boundary))
   {
    y_adj = 0;
    while (place_meeting(x+hspeed,y-y_adj, obj_boundary) && y_adj <= abs(slope_mod*hspeed))
          {
           y_adj += 1;
          }
    if (place_meeting(x+hspeed,y-y_adj,obj_boundary))
       {
        while (!place_meeting(x+sign(hspeed),y,obj_boundary))
              {
               x += sign(hspeed);
              } 
        hspeed = -hspeed * .7;
       }
    //Slope Encountered
    else
       {
        if (direction < 40 && direction > -40)
           {
            direction += choose(65,70,75,80,90,95);
           }  
        if (direction > 140 && direction < 220)
           {
            direction -= choose(65,70,75,80,90,95);
           }
       }
   }

//Vertical Collision
if (place_meeting(x,y+vspeed,obj_boundary))
   {
    y_adj = 0;
    while (place_meeting(x-y_adj,y+vspeed, obj_boundary) && y_adj <= abs(slope_mod*vspeed))
          {
           y_adj += 1;
          }
    //instance_create(x-y_adj,y+vspeed,obj_test);
    if (place_meeting(x-y_adj,y+vspeed,obj_boundary))
       {
        while (!place_meeting(x,y+sign(vspeed),obj_boundary))
              {
               y += sign(vspeed);
              }  
        /*if (place_meeting(x,y,obj_boundary))
           {
            sprite_index = spr_player_charging;
            x = xprevious;
            y = y-3;
           }*/
        if (abs(vspeed > 2))
           {
            vspeed = -vspeed * .7;
           }
        else
           {
            vspeed = 0;
           }
       }
    //Slope Encountered
    else
       {
        if (direction < 130 && direction > 50)
           {
            direction += choose(65,70,75,80,90,95);
           }
        if (direction < 310 && direction > 230)
           {
            direction -= choose(65,70,75,80,90,95);
           }
       }
   }

/*   
//Right or Down Collision with slope
if (place_meeting(x+hspeed,y+vspeed,obj_boundary_slope))
   {
    while (!place_meeting(x+sign(hspeed),y+sign(vspeed),obj_boundary_slope))
          {
           x += sign(hspeed);
           y += sign(vspeed);
          } 
    speed = speed * .7;   
    if (direction > 260 && direction < 310)
       {
        direction -= choose(65,70,75,80,90,95);
       }
    else if (direction > 320 && direction < 370)
       {
        direction += choose(65,70,75,80,90,95);
       }
    else if (direction >= 310 && direction <= 320)
       {
        direction += 180;
       }
   }

//Left or Down Collision with slope_L
if (place_meeting(x+hspeed,y+vspeed,obj_boundary_slope_L))
   {
    while (!place_meeting(x+sign(hspeed),y+sign(vspeed),obj_boundary_slope_L))
          {
           x += sign(hspeed);
           y += sign(vspeed);
          } 
    speed = speed * .7;   
    if (direction > 230 && direction < 280)
       {
        direction += choose(65,70,75,80,90,95);
       }
    else if (direction > 170 && direction < 220)
       {
        direction -= choose(65,70,75,80,90,95);
       }
    else if (direction >= 220 && direction <= 230)
       {
        direction += 180;
       }
   }  

//Right or Up Collision with slope_U
if (place_meeting(x+hspeed,y+vspeed,obj_boundary_slope_U))
   {
    while (!place_meeting(x+sign(hspeed),y+sign(vspeed),obj_boundary_slope_U))
          {
           x += sign(hspeed);
           y += sign(vspeed);
          } 
    speed = speed * .7;   
    if (direction > 50 && direction < 100)
       {
        direction -= choose(65,70,75,80,90,95);
       }
    else if (direction > -10 && direction < 40)
       {
        direction -= choose(65,70,75,80,90,95);
       }
    else if (direction >= 50 && direction <= 40)
       {
        direction += 180;
       }
   }

//Left or Up Collision with slope_UL
if (place_meeting(x+hspeed,y+vspeed,obj_boundary_slope_UL))
   {
    while (!place_meeting(x+sign(hspeed),y+sign(vspeed),obj_boundary_slope_UL))
          {
           x += sign(hspeed);
           y += sign(vspeed);
          } 
    speed = speed * .7;   
    if (direction > 80 && direction < 130)
       {
        direction += choose(65,70,75,80,90,95);
       }
    else if (direction > 140 && direction < 190)
       {
        direction += choose(65,70,75,80,90,95);
       }
    else if (direction >= 130 && direction <= 140)
       {
        direction += 180;
       }
   }
                  
//Vertical Collision with slope
/*if (place_meeting(x,y+vspeed,obj_boundary_slope))
   {
    //instance_create(x-y_adj,y+vspeed,obj_test);
    while (!place_meeting(x,y+sign(vspeed),obj_boundary_slope))
          {
           y += sign(vspeed);
          }  
    if (place_meeting(x,y,obj_boundary))
         {
          sprite_index = spr_player_charging;
          x = xprevious;
          y = y-3;
         }
    if (abs(vspeed > 2))
       {
        vspeed = vspeed * .7;
        direction += choose(65,70,75,80,90,95);
       }
    else
       {
        vspeed = 0;
       }
    }    

//Vertical Collision with slope 2
if (place_meeting(x,y+vspeed,obj_boundary_slope_L))
   {
    //instance_create(x-y_adj,y+vspeed,obj_test);
    while (!place_meeting(x,y+sign(vspeed),obj_boundary_slope_L))
          {
           y += sign(vspeed);
          }  
    if (place_meeting(x,y,obj_boundary))
         {
          sprite_index = spr_player_charging;
          x = xprevious;
          y = y-3;
         }
    if (abs(vspeed > 2))
       {
        vspeed = vspeed * .7;
        direction -= choose(65,70,75,80,90,95);
       }
    else
       {
        vspeed = 0;
       }
    }         
    
//Vertical Collision with slope 3
if (place_meeting(x,y+vspeed,obj_boundary_slope_U))
   {
    //instance_create(x-y_adj,y+vspeed,obj_test);
    while (!place_meeting(x,y+sign(vspeed),obj_boundary_slope_U))
          {
           y += sign(vspeed);
          }  
    if (place_meeting(x,y,obj_boundary))
         {
          sprite_index = spr_player_charging;
          x = xprevious;
          y = y-3;
         }
    if (abs(vspeed > 2))
       {
        vspeed = vspeed * .7;
        direction += choose(65,70,75,80,90,95);
       }
    else
       {
        vspeed = 0;
       }
    }       
    
//Vertical Collision with slope 4
if (place_meeting(x,y+vspeed,obj_boundary_slope_UL))
   {
    //instance_create(x-y_adj,y+vspeed,obj_test);
    while (!place_meeting(x,y+sign(vspeed),obj_boundary_slope_UL))
          {
           y += sign(vspeed);
          }  
    if (place_meeting(x,y,obj_boundary))
         {
          sprite_index = spr_player_charging;
          x = xprevious;
          y = y-3;
         }
    if (abs(vspeed > 2))
       {
        vspeed = vspeed * .7;
        direction -= choose(65,70,75,80,90,95);
       }
    else
       {
        vspeed = 0;
       }
    }     
