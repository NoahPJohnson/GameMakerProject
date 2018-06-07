///Attacking state
struck = false;
if (enemy_parent.meleeAttack == true)
   {
   
        //radius += room_speed * (0.5/60);
        if (alarm[2] == -1)
           {
            phase += ANGLE_INCREMENT;
           }
           
        if (stop == false)
           {
            if (!place_meeting(center_X + radius * dcos(phase),y,obj_boundary))
               { 
                x = center_X + (radius * dcos(phase)) * -enemy_parent.melee_dir;
               }
            if (!place_meeting(x,center_Y - radius * dsin(phase),obj_boundary))
               { 
                y = center_Y - radius * dsin(phase);
               }
           }
        else
           {
            if (radius < 160)
               {
                radius += room_speed * (5/60);
               }
            if (!place_meeting(x+22,y,obj_boundary)&&!place_meeting(x-22,y,obj_boundary)&&!place_meeting(x,y+22,obj_boundary)&&!place_meeting(x,y-22,obj_boundary))
               {
                x = center_X + (radius * dcos(phase)) * -enemy_parent.melee_dir;
                y = center_Y - radius * dsin(phase);
               }
            else
               {
                if (alarm[2] == -1)
                   {
                    alarm[2] = room_speed * (40/60);
                   }
                if (!place_meeting(x,y+vspeed,obj_boundary))
                   {
                    vspeed += 0.9;
                   }
                scr_ball_collision_bounce();
               }
           }
   }


//Blocked by Bunt
if (place_meeting(x,y,obj_bunt_bat))
   {
    obj_player.sp -= 30;
    
    //Player Hitstop
    /*obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = room_speed * (3/60);
    if (obj_player.state != states.hitstop)
       {
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    
    //Enemy Hitstop
    enemy_parent.hitstop = false;
    enemy_parent.damage_hitstop = false;
    enemy_parent.alarm[9] = room_speed * (3/60);
    enemy_parent.old_state = enemy_parent.state;
    enemy_parent.state = e_state.hitstop;*/
    //instance_destroy();
   }

scr_ball_hit_by_bat();
