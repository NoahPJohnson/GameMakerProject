///Collision Bounce
if (place_meeting(x,y,obj_boundary))
   {
    show_debug_message("Clipping before ANY collision. ID = " + string(instance_place(x,y,obj_boundary)));
   }
   
if (place_meeting(x+hspeed,y,obj_player))
   {
    incidence = direction;
     
    new_dir = 180 - incidence;
    if (new_dir < 0)
       {
        new_dir += 360;
       }
    direction = new_dir;
    speed *= .7;
    //show_debug_message("Hit player. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed)); 
   }
/*if (place_meeting(x+hspeed,y,obj_enemy))
   {
    colliding_object = instance_place(x+hspeed,y,obj_enemy);
    if (colliding_object.state == e_state.crash)
       {
        incidence = direction;
     
        new_dir = 180 - incidence;
        if (new_dir < 0)
           {
            new_dir += 360;
           }
        direction = new_dir;
        speed *= .7;
        //show_debug_message("Hit player. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       } 
   }*/   
      
   
//Horizontal Collision
if (place_meeting(x+hspeed,y,obj_boundary))
   {
    colliding_object = instance_place(x+hspeed,y,obj_boundary);
    if (colliding_object.object_index == obj_boundary_slope)
       {
        incidence = direction;
        //heading toward the non-sloped part of the slope
        if (incidence > 45 && incidence < 225)
           {
            
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //show_debug_message("Hit slope on wrong side. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
        //heading toward sloped part of the slope
        else
           {
            
            new_dir = 90 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //show_debug_message("Hit slope. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_L)
       {
        incidence = direction; 
        //Heading toward the non-sloped part of Slope L
        if ((incidence > 315 && incidence < 360) || (incidence >= 0 && incidence < 135))
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //show_debug_message("Hit slope L on wrong side. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
        //Heading toward the sloped part of Slope L
        else
           {  
            new_dir = 270 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //show_debug_message("Hit slope L. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_U)
       {
        incidence = direction;
        //NON Slope of Slope U 
        if (incidence > 135 && incidence < 315)
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
           }
        //Slope
        else
           {  
            new_dir = 270 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_UL)
       {
        incidence = direction;
        //NON Slope of Slope UL
        if ((incidence >= 0 && incidence < 45) && (incidence > 225 && incidence < 360))
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
           }
        //Slope
        else
           {   
            new_dir = 90 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
           }
       }
    //Regular Boundary
    else
       {
        incidence = direction;
        new_dir = 180 - incidence;
        if (new_dir < 0)
           {
            new_dir += 360;
           }
        direction = new_dir;
        speed *= .7;
        //show_debug_message("Hit regular boundary. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed)); 
       }
   }

if (place_meeting(x,y,obj_boundary))
   {
    show_debug_message("Clipping before vertical collision");
   }
   
//Vertical Collision
if (place_meeting(x,y+vspeed,obj_player))
   {
    incidence = direction;
    new_dir = 360 - incidence;
    if (new_dir < 0)
       {
        new_dir += 360;
       }
    direction = new_dir;
    if (speed > 2)
       {
        speed *= .7; 
       }
    else
       {
        speed = 0;
       }
    //show_debug_message("Hit player. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
   }
/*if (place_meeting(x,y+vspeed,obj_enemy))
   {
    colliding_object = instance_place(x,y+vspeed,obj_enemy);
    if (colliding_object.state == e_state.crash)
       {
        incidence = direction;
     
        new_dir = 360 - incidence;
        if (new_dir < 0)
           {
            new_dir += 360;
           }
        direction = new_dir;
        if (speed > 2)
           {
            speed *= .7; 
           }
        else
           {
            speed = 0;
           }
        show_debug_message("Hit player. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       } 
   }*/
if (place_meeting(x,y+vspeed,obj_boundary))
   {
    colliding_object = instance_place(x,y+vspeed,obj_boundary);
    if (colliding_object.object_index == obj_boundary_slope)
       {
        incidence = direction;
        if ((incidence < 45 && incidence >= 0) || (incidence > 225 && incidence < 360))
           {
            
            new_dir = 90 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope. Vertical  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));  
           }
        else
           {
            
            new_dir = 360 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope on wrong side. Vertical.  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_L)
       {
        incidence = direction;
        if (incidence > 135 && incidence < 315)
           {  
            new_dir = 270 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope L. Vertical  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
        else
           {
            new_dir = 360 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope L on wrong side. Vertical.  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_U)
       {
        incidence = direction;
        if ((incidence < 135 && incidence >= 0) || (incidence < 360 && incidence > 315))
           {  
            new_dir = 270 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope U. Vertical  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
        else
           {
            new_dir = 360 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope U on wrong side. Vertical.  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_UL)
       {
        incidence = direction;
        if (incidence > 45 && incidence < 225)
           {  
            new_dir = 90 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
           }
        else
           {
            new_dir = 360 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            if (speed > 2)
               {
                speed *= .7; 
               }
            else
               {
                speed = 0;
               }
           }
       }
    else
       {
        
        incidence = direction;
        new_dir = 360 - incidence;
        if (new_dir < 0)
           {
            new_dir += 360;
           }
        direction = new_dir;
        if (speed > 2)
           {
            speed *= .7; 
           }
        else
           {
            speed = 0;
           }
        //show_debug_message("Hit Boundary. V  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       }    
   }

   
if (place_meeting(x,y,obj_boundary))
   {
    show_debug_message("Clipping!!");
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
