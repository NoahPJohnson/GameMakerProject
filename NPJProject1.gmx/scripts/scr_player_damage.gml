/*if (place_meeting(x, y, obj_enemy) && iframes = false && siframes = false)
   {
    attacking_enemy = instance_place(x,y, obj_enemy)
    if (attacking_enemy.state != e_state.crash)
       {
        if (attacking_enemy.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 15;
        if (alarm[7] = -1)
           {
            alarm[7] = 7;   
           }
        knock_force = 8;
        state = states.knockback;    
       }
   }  */

if (place_meeting(x, y, obj_projectile) && iframes = false && siframes = false)
   {   
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck = false)
       {
        if (projectile_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 7;
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
                alarm[11] = room_speed * (3/60);
                state = states.hitstop;
                //scr_movement();  
               }
            else
               {
                show_debug_message("Hit by projectile during DRIVE.");
                hitstop = false;
                damage_hitstop = false;
                alarm[11] = room_speed * (3/60);
                old_state = state;
                state = states.hitstop;
               }
               
            
           }
        projectile_meeting.state = proj_state.destroyed;
       }    
   }
else if (place_meeting(x, y, obj_projectile) && (iframes == true || siframes == true))
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
if (place_meeting(x, y, obj_enemy_melee) && iframes = false && siframes = false)
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
    hp -= 12;
     
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
        alarm[11] = room_speed * (3/60);
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
