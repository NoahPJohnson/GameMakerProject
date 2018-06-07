if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        if (obj_player.right = true)
           {
            hitdir = 1; 
           }
        else
           {
            hitdir = -1;
           }
        impetus = 5 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10) + ((1-stop) * 5);
        hitstun_direction = 0 * hitdir;
        //old_state = state;
        alarm[3] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
        //Player Hitstop
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[3];
        if (obj_player.state != states.hitstop)
           {
            //watch out for a potential issue where player returns to wrong state. just in case
            obj_player.old_state = obj_player.state;
           }
        obj_player.state = states.hitstop;
        //damage_hitstop = true;
        if (state != ball_n_chain_state.reversed)
           {
            enemy_parent.alarm[8] += room_speed * (100/60);
           }
        alarm[2] = -1;
        state = ball_n_chain_state.hitstop;
        //show_debug_message("Hit by the bat! " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       }   
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit == false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        if (obj_player.right = true)
           {
            hitdir = 1; 
           }
        else
           {
            hitdir = -1;
           }
        impetus = 10 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10) + ((1-stop) * 5);
        hitstun_direction = (80-(obj_player.chargeOne*5)-(obj_player.chargeTwo*10)) * hitdir;
        //old_state = state;
        alarm[3] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
        
        //Player Hitstop
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[3];
        if (obj_player.state != states.hitstop)
           {
            //watch out for a potential issue where player returns to wrong state. just in case
            obj_player.old_state = obj_player.state;
           }
        obj_player.state = states.hitstop;
        
        if (state != ball_n_chain_state.reversed)
           {
            enemy_parent.alarm[8] += room_speed * (100/60);
           }
        alarm[2] = -1;
        state = ball_n_chain_state.hitstop;
        //show_debug_message("Hit by launcher. State is now: " + string(state));

        //show_debug_message("Hit by the LAUNCHER! " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       } 
   }          

if (place_meeting(x, y, obj_bat_spike) && obj_bat_spike.hit == false)
   {
    if (obj_player.right == true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        if (place_meeting(x,y+1, obj_boundary))
           {
            impetus = 7;
            hitstun_direction = 60 * hitdir;
           }
        else
           {
            impetus = 7;
            hitstun_direction = -60 * hitdir;
           }
        //old_state = state;
        alarm[3] = room_speed * (3/60);
    
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        if (obj_player.alarm[7] == -1)
           {
            obj_player.alarm[7] = room_speed * (20/60);
           }
    
        obj_player.iframes = true;
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
    
        //Player Hitstop
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[9];
        if (obj_player.state != states.hitstop)
           {
            //watch out for a potential issue where player returns to wrong state. just in case
            obj_player.old_state = obj_player.state;
           }
        obj_player.state = states.hitstop;
        //show_debug_message("Hit by spike. player state is: " + string(obj_player.state) + " old state is " + string(obj_player.old_state));
        
        if (state != ball_n_chain_state.reversed)
           {
            enemy_parent.alarm[8] += room_speed * (100/60);
           }
        alarm[2] = -1;
        state = ball_n_chain_state.hitstop;
       }
    else
       {
        //Player Wall Bounce
        if (obj_player.alarm[8] == -1)
           {
            obj_player.alarm[8] = room_speed * (18/60);
           }
        if (obj_player.alarm[7] == -1)
           {
            obj_player.alarm[7] = room_speed * (20/60);
           }
    
        obj_player.iframes = true;
        obj_player.hitdir = -hitdir;
        obj_player.knock_force = 12;
        //show_debug_message("Change the player's state to knockback. Current is: " + string(obj_player.state));
        obj_player.state = states.knockback;
       }
   }

if (place_meeting(x,y,obj_bunt_bat) && obj_bunt_bat.hit == false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    impetus = 5;
    hitstun_direction = 20 * hitdir;
    alarm[3] = room_speed * (3/60);
    //Player Hitstop
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[3];
    if (obj_player.state != states.hitstop)
       {
        //watch out for a potential issue where player returns to wrong state. just in case
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    
    if (state != ball_n_chain_state.reversed)
       {
        enemy_parent.alarm[8] += room_speed * (100/60);
       }
    alarm[2] = -1;
    state = ball_n_chain_state.hitstop;
   }    

//Hit by explosion or other neutral damage
/*if (place_meeting(x,y,obj_explosion_hitbox) && hitstun == false)
   {
    if (x < obj_explosion_hitbox)
       {
        hitdir = -1;
       }
    else
       {
        hitdir = 1;
       }
    hp -= 1;
    scr_enemy_hp_zero();
    old_speed = 0;
    impetus = 19;
    hitstun_direction = 75 * hitdir;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    damage_hitstop = true;
    state = e_state.hitstop;
   }*/
   
//Out of HP
//scr_enemy_hp_zero();                
