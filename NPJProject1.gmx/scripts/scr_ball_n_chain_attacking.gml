///Attacking state
struck = false;
if (enemy_parent.meleeAttack == true)
{
    phase += ANGLE_INCREMENT;
           
    if (stop == false)
    {
        thrown = false;
        //if (!place_meeting(center_X + radius * dcos(phase),y,obj_boundary))
        //   { 
            x = center_X + (radius * dcos(phase)) * -enemy_parent.melee_dir;
        //   }
        //if (!place_meeting(x,center_Y - radius * dsin(phase),obj_boundary))
        //   { 
            y = center_Y - radius * dsin(phase);
        //   }
    }
    else
    {
        if (radius < 160)
        {
            radius += room_speed * (5/60);
        }
        if (!place_meeting(x,y,obj_boundary) && !place_meeting(x,y,obj_enemy))
        {
            if (thrown == false)
            {
                speed = throw_speed;
                if (enemy_parent.melee_dir > 0)
                {
                    direction = throw_angle;
                }
                else
                {
                    direction = 180 - throw_angle;
                }
                thrown = true;
            }
        }
        //if (!place_meeting(x+22,y,obj_boundary)&&!place_meeting(x-22,y,obj_boundary)&&!place_meeting(x,y+22,obj_boundary)&&!place_meeting(x,y-22,obj_boundary))
        //   {
            //x = center_X + (radius * dcos(phase)) * -enemy_parent.melee_dir;
            //y = center_Y - radius * dsin(phase);
        //   }
        //else
        //   {
            if (alarm[2] == -1)
               {
                alarm[2] = room_speed * (40/60);
               }
            if (!place_meeting(x,y+abs(vspeed),obj_boundary))
               {
                motion_add(270,0.9);
               }
            
            scr_ball_collision_bounce();
           //}
       }
    spin_difference = sign(x-enemy_parent.x);
    if (spin_difference != old_spin_difference)
    {
        if (spin_difference > 0) 
        {
            //Play swing sound
            if (instance_exists(obj_music_sfx_manager))
            {
                with (obj_music_sfx_manager) 
                {
                    scr_prompt_sound(snd_ball_n_chain_swing_SFX,other,false);    
                }
            }
        }
        old_spin_difference = spin_difference;
    }  
}


//Blocked by Bunt
if (place_meeting(x,y,obj_bunt_bat))
   {
    obj_player.sp -= 30;
   }

scr_ball_n_chain_links();
   
scr_ball_hit_by_bat();
