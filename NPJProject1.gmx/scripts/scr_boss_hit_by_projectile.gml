projectile_meeting = instance_place(x,y, obj_projectile)
if (projectile_meeting != noone)
   {
    if (projectile_meeting.struck == true)
       {
        if (vulnerable == true)
           {    
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
            scr_score_tracker_script_ball();
            //scr_enemy_hp_zero();
            old_speed = 7;
            impetus = 0;
            hitdir = 1; 
            saved_shot_timer = shot_timer;
            old_state = state;
            //alarm[7] = -1;
            alarm[0] = room_speed * ((((hp < 1)*50) + 5)/60);
            damage_hitstop = false;
            //show_debug_message("Weakpoint Hit.");
           }
        else
           {
            saved_shot_timer = shot_timer;
            old_state = state;
            alarm[0] = room_speed * (3/60);
            damage_hitstop = false;
           }
        projectile_meeting.state = proj_state.destroyed;
        state = boss_state.hitstop;
       }
   }

if (place_meeting(x,y,obj_enemy_ball_hitbox))
   {
    ball_meeting = instance_place(x,y,obj_enemy_ball_hitbox);
    if (ball_meeting.state == ball_n_chain_state.reversed)
       {
        if (vulnerable == true)
           {
            if (place_meeting(x,y+1,obj_boundary) && direction > 180 && direction < 360)
               {
                //direction = -projectile_meeting.direction;
                hitstun_direction = -ball_meeting.direction;
               }
            else
               {
                hitstun_direction = ball_meeting.direction;
               }
            hp -= 1;
            scr_score_tracker_script_ball();
            //scr_enemy_hp_zero();
            old_speed = 10;
            impetus = 0;
            hitdir = 1; 
            old_state = state;
            //alarm[7] = -1;
            alarm[0] = room_speed * ((((hp < 1)*50) + 3)/60);
            damage_hitstop = true;
           }
        else
           {
            old_state = state;
            alarm[0] = room_speed * (3/60);
            damage_hitstop = false;
           }
        
        
        ball_meeting.damage_hitstop = false;
        ball_meeting.alarm[3] = alarm[0];
        ball_meeting.old_state = ball_meeting.state;
        ball_meeting.state = ball_n_chain_state.hitstop;
        
        
        state = boss_state.hitstop;
       }
   }         
