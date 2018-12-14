if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = room_speed * (3/60);
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        //damage_hitstop = true;
        //show_debug_message("Hit by the bat! " + string(direction) + " | " + string(speed) + " | " + string(vspeed));
       }   
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit == false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
       {
        //Player Hitstop
        if (obj_player.state != states.hitstop)
           {
            obj_player.hitstop = false;
            obj_player.damage_hitstop = false;
            obj_player.alarm[11] = room_speed * (3/60);
            obj_player.old_state = obj_player.state;
            obj_player.state = states.hitstop;
           }
        //show_debug_message("Hit by launcher. State is now: " + string(state));
        
        if (sprite_index != spr_enemy_shield_Up && (obj_player.chargeOne == true || obj_player.chargeTwo == true))
           {
            show_debug_message("Shield was launched!");
            shield_hitstun = true;
            sprite_index = spr_enemy_shield_Up;
            x = enemy_parent.x;
            y = enemy_parent.y-48;
            old_sprite = sprite_index;
            old_X = x;
            old_Y = y;
            guard_position = 1;
            old_guard_position = guard_position;
            alarm[5] = room_speed * (30/60);
           }
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
        /*obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[9];
        if (obj_player.state != states.hitstop)
           {
            //watch out for a potential issue where player returns to wrong state. just in case
            obj_player.old_state = obj_player.state;
           }
        obj_player.state = states.hitstop;*/
        //show_debug_message("Hit by spike. player state is: " + string(obj_player.state) + " old state is " + string(obj_player.old_state));
        
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
