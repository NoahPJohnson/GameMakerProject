

if (place_meeting(x, y, obj_projectile) && iframes = false && siframes = false && invincibility_active == false)
   {   
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck == false)
       {
        if (projectile_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 11;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            if (drive == false)
               {
                crouching = false;
                charging = false;
                chargeOne = false;
                chargeTwo = false;
                alarm[3] = -1;
                alarm[4] = -1; 
            
                /*
                if (alarm[7] == -1)
                   {
                    iframes = true; 
                    alarm[7] = room_speed * (60/60);
                   }
                if (alarm[8] = -1)
                   {
                    //Invincibility
                    
                    jumping = false;
                    sprite_index = spr_player_iframes;
                    alarm[8] = room_speed * (10/60);
                    knock_force = 4;
                    state = states.knockback;
                   }
                */
                invincibility_time = 60;
                knockback_time = 10;
                knock_force = 4;
                damage_hitstop = true;
                show_debug_message("Hit by projectile.");
                if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
                //alarm[11] = room_speed * (3/60);
                state = states.hitstop;
                //scr_movement();  
               }
            else
               {
                show_debug_message("Hit by projectile during DRIVE.");
                hitstop = false;
                damage_hitstop = false;
                if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
                old_state = state;
                state = states.hitstop;
               }
               
            
           }
        projectile_meeting.state = proj_state.destroyed;
       }    
   }
else if (place_meeting(x, y, obj_projectile) && (iframes == true || siframes == true || invincibility_active == true))
   {
    //A little bit of hitstop for sliding by projectile 
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck = false)
       {
        hitstop = false;
        damage_hitstop = false;
        alarm[11] = room_speed * (3/60);
        old_state = state;
        state = states.hitstop;
       }
   }

//Hit by melee attack   
if (place_meeting(x, y, obj_enemy_melee) && iframes = false && siframes = false && invincibility_active == false)
   {   
    if (!collision_line(x,y,obj_enemy_melee.enemy_parent.x,obj_enemy_melee.enemy_parent.y,obj_boundary,false,true) && !collision_line(x,y,obj_enemy_melee.enemy_parent.x,obj_enemy_melee.enemy_parent.y,obj_bunt_bat,false,true))
       {
        melee_meeting = instance_place(x,y, obj_enemy_melee);
        if (melee_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 16;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility
            /*
            jumping = false;
            sprite_index = spr_player_iframes;
            if (alarm[7] == -1)
               {
                iframes = true; 
                alarm[7] = room_speed * (90/60);
               }
            if (alarm[8] = -1)
               {
                alarm[8] = room_speed * (25/60);
               }
            */
            invincibility_time = 90;
            knockback_time = 25;
            knock_force = 6;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
            //Enemy Hitstop
            melee_meeting.enemy_parent.damage_hitstop = false;
            melee_meeting.enemy_parent.alarm[9] = alarm[11];
            melee_meeting.enemy_parent.old_state = melee_meeting.enemy_parent.state;
            //show_debug_message("enemy that hit me is " + string(melee_meeting.enemy_parent));
            melee_meeting.enemy_parent.state = e_state.hitstop;
            //show_debug_message("enemy that hit me is " + string(melee_meeting.enemy_parent) + " state is " + string(melee_meeting.enemy_parent.state));
            //state = states.knockback;
            melee_meeting.alarm[0] = 1;
            //scr_movement();         
            state = states.hitstop;         
           }
        //knock_force = 6;
        //state = states.knockback;
        melee_meeting.alarm[0] = 1;
       }
   }
   
//Hit by enemy ball n chain
if (place_meeting(x,y,obj_enemy_ball_hitbox) && iframes == false && siframes == false && invincibility_active == false)
   {
    if (!collision_line(x,y,obj_enemy_ball_hitbox.x,obj_enemy_ball_hitbox.y,obj_boundary,false,true) && !collision_line(x,y,obj_enemy_ball_hitbox.x,obj_enemy_ball_hitbox.y,obj_bunt_bat,false,true))
       {
        ball_meeting = instance_place(x,y, obj_enemy_ball_hitbox)
        if (ball_meeting.state != ball_n_chain_state.reversed)
           {
            if (ball_meeting.x > x)
               {
                hitdir = -1;
               } 
            else
               {
                hitdir = 1;
               }
            hp -= 16;
            scr_score_tracker_script_strike();
            if (iframes == false)
               {
                crouching = false;
                charging = false;
                chargeOne = false;
                chargeTwo = false;
                alarm[3] = -1;
                alarm[4] = -1; 
            
                invincibility_time = 90;
                knockback_time = 25;
                knock_force = 6;
                damage_hitstop = true;
                show_debug_message("Hit by Ball n Chain");
                if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }
            
                //Ball N Chain Hitstop
                ball_meeting.damage_hitstop = false;
                ball_meeting.alarm[3] = alarm[11];
                ball_meeting.old_state = ball_meeting.state;
                ball_meeting.state = ball_n_chain_state.hitstop;
            
            
                state = states.hitstop;
               }
           }
       }    
   }
   
//Hit by explosion
if (place_meeting(x,y,obj_explosion_hitbox) && iframes = false && siframes = false && invincibility_active == false)
   {
    if (!collision_line(x,y,obj_explosion_hitbox.x,obj_explosion_hitbox.y,obj_boundary,false,true))
       {
        explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        if (explosion_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 20;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            show_debug_message("Player hit by explosion.");
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility

            invincibility_time = 100;
            knockback_time = 30;
            knock_force = 8;
            damage_hitstop = true;
            if (hp < 1)
               {
                alarm[11] = room_speed * (40/60);
               }
            else
               {
                alarm[11] = room_speed * (3/60);
               }

            //explosion_meeting.alarm[0] = 1;
      
            state = states.hitstop;         
           }

        //melee_meeting.alarm[0] = 1;
       }
   }
//Hit by environment or other neutral damage
if (place_meeting(x,y,obj_spike_floor) && iframes = false && siframes = false && invincibility_active == false)
   {
        //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        hitdir = 0;
        hp -= 19;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility

            invincibility_time = 100;
            knockback_time = 24;
            knock_force = 8;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }

            //explosion_meeting.alarm[0] = 1;
      
            state = states.hitstop;         
           }
   }
if (place_meeting(x,y,obj_spike_wall_L) && iframes = false && siframes = false && invincibility_active == false)
   {
        //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        hitdir = 1;
        hp -= 19;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility

            invincibility_time = 100;
            knockback_time = 22;
            knock_force = 6;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }

            //explosion_meeting.alarm[0] = 1;
      
            state = states.hitstop;         
           }
   }
if (place_meeting(x,y,obj_spike_wall_R) && iframes = false && siframes = false && invincibility_active == false)
   {
        //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        hitdir = -1;
        hp -= 19;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility

            invincibility_time = 100;
            knockback_time = 22;
            knock_force = 6;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }

            //explosion_meeting.alarm[0] = 1;
      
            state = states.hitstop;         
           }
   }
if (place_meeting(x,y,obj_spike_ceiling) && iframes = false && siframes = false && invincibility_active == false)
   {
        //explosion_meeting = instance_place(x,y, obj_explosion_hitbox);
        hitdir = 0;
        hp -= 19;
        scr_score_tracker_script_strike();
        if (iframes == false)
           {
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1;
            //Invincibility

            invincibility_time = 100;
            knockback_time = 24;
            knock_force = 6;
            damage_hitstop = true;
            if (hp < 1)
                   {
                    alarm[11] = room_speed * (40/60);
                   }
                else
                   {
                    alarm[11] = room_speed * (3/60);
                   }

            //explosion_meeting.alarm[0] = 1;
      
            state = states.hitstop;         
           }
   }
/*else if (place_meeting(x, y, obj_enemy_melee) && (iframes == true || siframes == true))
   {
    //A little bit of hitstop for sliding by melee  
    melee_meeting = instance_place(x,y, obj_enemy_melee);
    melee_meeting.alarm[0] = 1;
    hitstop = false;
    damage_hitstop = false;
    alarm[11] = room_speed * (3/60);
    old_state = state;
    state = states.hitstop;
   }*/              
