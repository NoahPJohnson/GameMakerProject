///scr_create_grenade_projectile()    
    //x = Vx * frames
    //y = Vy * frames - (1/2 (0.8*frames^2))
    //x = speed * cos(direction) * frames
    //y = speed * sin(direction) * frames - (1/2)(0.8)(frames^2)
    //Vx = speed * cos(direction)
    //Vy = (speed * sin(direction)) - (0.8 * frames)
    //frames = (2*speed*sin(direction))/0.8
    //frames_to_reach_max_height = (speed * sin(direction))/0.8
    //ftrmh * 0.8 = speed * sin(direction)
    var firing_angle = point_direction(x,y,obj_player.x,obj_player.y);
    var firing_velocity = 15;
    var ftrmh = 0;
    var angle_found = false;
    for (i = 0; i < 25; i++)
        {
         firing_angle = point_direction(x,y,obj_player.x+(sign(obj_player.x-x)*48),obj_player.y);
         firing_velocity += 1;
         for (j = 1; j < 18; j++)
             {
              firing_angle += (sign(obj_player.x-x)*(5));
              if (sign(obj_player.x-x) < 0)
                 {
                  firing_angle = clamp(firing_angle,100,170);
                 }
              else
                 {
                  firing_angle = clamp(firing_angle,0,80);
                 }
              if (!collision_line(x,y,x+lengthdir_x(distance_to_object(obj_player),firing_angle),y+lengthdir_y(distance_to_object(obj_player),firing_angle),obj_boundary,false,false))
                 {
                  //instance_create(x+lengthdir_x(distance_to_object(obj_player),firing_angle),y+lengthdir_y(distance_to_object(obj_player),firing_angle),obj_test2);
                  //firing_angle = point_direction(x,y,obj_player.x-((j*(obj_player.x-x))/16),obj_player.y-160);
                  ftrmh = (firing_velocity * sin(firing_angle*(pi/180)))/0.8;
                  if (((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))) > abs((obj_player.y-160)-(y-32)))
                     {
                      angle_found = true;
                      //instance_create(obj_player.x-((j*(obj_player.x-x))/16),obj_player.y-96,obj_test2);
                      //instance_create(x+(firing_velocity*cos(firing_angle*(pi/180))*ftrmh),y-((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))),obj_test2);
                      show_debug_message(string((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))) + " > " + string(abs((obj_player.y-160)-(y-32))));
                      //show_debug_message("FTRMH = " + string(ftrmh));
                      show_debug_message("Break the loop");
                      break;
                     }
                  else
                     {
                      //instance_create(x+(firing_velocity*cos(firing_angle*(pi/180))*ftrmh),y-((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))),obj_test2);
                      //show_debug_message("Rejected firing angle = " + string(firing_angle) + " and velocity = " + string(firing_velocity));
                      //show_debug_message(string((firing_velocity * sin(firing_angle) * ftrmh) - (0.5*0.8*power(ftrmh,2))) + " <= " + string(abs((obj_player.y-64)-y)));
                     }
                 }
             }
         if (angle_found == true)
            {
             break;
            }
        }   
    show_debug_message("Firing Angle = " + string(firing_angle));
    show_debug_message("Firing Velocity = " + string(firing_velocity));
    if (angle_found == true)
       {
        projectile = scr_create_projectile(firing_velocity,firing_angle,x,y-32,obj_projectile_grenade);//instance_create(x,y-32, obj_projectile_grenade);
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_enemy_grenade_pin_pull_SFX,other,false);    
            }
        }
       }
