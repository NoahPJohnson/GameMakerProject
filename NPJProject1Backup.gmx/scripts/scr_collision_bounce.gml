///Collision Bounce
/*if (place_meeting(x,y,obj_boundary) || place_meeting(x,y,obj_player))
   {
    show_debug_message("Clipping before ANY collision. ID = " + string(instance_place(x,y,obj_boundary)));
   }*/
   
if (place_meeting(x+hspeed,y,obj_player) && object_index != obj_enemy_fragment)
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
      
   
//Horizontal Collision
if (place_meeting(x+hspeed,y,obj_boundary))
   {
    colliding_object = instance_place(x+hspeed,y,obj_boundary);
    if (colliding_object.object_index == obj_boundary_slope)
       {
        incidence = direction;
        //heading toward the non-sloped part of the slope
        if ((incidence > 45 && incidence < 225) || y > colliding_object.y)
           {
            
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
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
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
            //show_debug_message("Hit slope. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_L)
       {
        incidence = direction; 
        //Heading toward the non-sloped part of Slope L
        if ((incidence > 315 && incidence < 360) || (incidence >= 0 && incidence < 135) || y > colliding_object.y)
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
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
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
            //show_debug_message("Hit slope L. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_U)
       {
        incidence = direction;
        //NON Slope of Slope U 
        if ((incidence > 135 && incidence < 315) || y < colliding_object.y )
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
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
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_UL)
       {
        incidence = direction;
        //NON Slope of Slope UL
        if ((incidence >= 0 && incidence < 45) || (incidence > 225 && incidence < 360) || y < colliding_object.y)
           {
            new_dir = 180 - incidence;
            if (new_dir < 0)
               {
                new_dir += 360;
               }
            direction = new_dir;
            speed *= .7;
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
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
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }
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
        //Play collision sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
            }
        }
        //show_debug_message("Hit regular boundary. H  " + string(direction) + " | " + string(speed) + " | " + string(vspeed)); 
       }
   }

/*if (place_meeting(x,y,obj_boundary) || place_meeting(x,y,obj_player))
   {
    show_debug_message("Clipping before vertical collision");
   }*/
   
//Vertical Collision
if (place_meeting(x,y+vspeed,obj_player) && object_index != obj_enemy_fragment)
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
        //Play collision sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
            }
        } 
       }
    else
       {
        speed = 0;
       }
    //show_debug_message("Hit player. V  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
   }

if (place_meeting(x,y+vspeed,obj_boundary))
   {
    colliding_object = instance_place(x,y+vspeed,obj_boundary);
    if (colliding_object.object_index == obj_boundary_slope)
       {
        incidence = direction;
        //heading toward the non-sloped part of the slope
        if ((incidence > 45 && incidence < 225) || y > colliding_object.y)
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
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                } 
               }
            else
               {
                speed = 0;
               }
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
            if (speed > 2)
               {
                speed *= .7;
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                } 
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_L)
       {
        incidence = direction;
        //Heading toward the non-sloped part of Slope L
        if ((incidence > 315 && incidence < 360) || (incidence >= 0 && incidence < 135) || y > colliding_object.y)
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
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                } 
               }
            else
               {
                speed = 0;
               }
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
            if (speed > 2)
               {
                speed *= .7;
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
               }
            else
               {
                speed = 0;
               }
            //show_debug_message("Hit slope L. Horizontal  " + string(direction) + " | " + string(speed) + " | " + string(vspeed) + " specifically: " + string(colliding_object));   
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_U)
       {
        incidence = direction;
        //NON Slope of Slope U 
        if ((incidence > 135 && incidence < 315) || y < colliding_object.y )
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
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
               }
            else
               {
                speed = 0;
               }
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
            if (speed > 2)
               {
                speed *= .7;
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
               }
            else
               {
                speed = 0;
               }
           }
       }
    else if (colliding_object.object_index == obj_boundary_slope_UL)
       {
        incidence = direction;
        //NON Slope of Slope UL
        if ((incidence >= 0 && incidence < 45) || (incidence > 225 && incidence < 360) || y < colliding_object.y)
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
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
               }
            else
               {
                speed = 0;
               }
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
            if (speed > 2)
               {
                speed *= .7;
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
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
            //Play collision sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                }
            }  
           }
        else
           {
            speed = 0;
           }
        if (place_meeting(x,y+vspeed,obj_player))
           {
            show_debug_message("Hitting player on the rebound.");
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
                //Play collision sound
                if (instance_exists(obj_music_sfx_manager))
                {
                    with (obj_music_sfx_manager) 
                    {
                        scr_prompt_sound(snd_ball_n_chain_contact_SFX,other,false);    
                    }
                }  
               }
            else
               {
                speed = 0;
               }
           }
        //show_debug_message("Hit Boundary. V  " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       }    
   }  
