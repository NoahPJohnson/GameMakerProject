projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == true)
       {
        //speed = 7;       
        if (place_meeting(x,y+1,obj_boundary) && direction > 180 && direction < 360)
           {
            //direction = -projectile_meeting.direction;
            hitstun_direction = -projectile_meeting.direction;
           }
        else
           {
            hitstun_direction = projectile_meeting.direction;
           }
        hp -= .5;
        scr_enemy_hp_zero();
        old_speed = 7;
        impetus = 0;
        hitdir = 1; 
        old_state = state;
        alarm[7] = -1;
        alarm[9] = room_speed * (3/60);
        damage_hitstop = true;
        
        projectile_meeting.state = proj_state.destroyed;
        state = e_state.hitstop;
        /*if (state != e_state.crash)
           {
            alarm[1] = room_speed * (15/60);
            hitstun = true;
            scr_collision_bounce();
            state = e_state.hitstun;
           }*/
       }
   }         
