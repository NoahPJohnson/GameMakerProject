if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    
    hp -= (1 + obj_player.chargeOne + (obj_player.chargeTwo*2));
    scr_enemy_hp_zero();
    old_speed = speed;
    impetus = 13 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10) + (instance_exists(melee_hitbox) * 7);
    hitstun_direction = 0;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    //Player Hitstop
    obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[9];
    if (obj_player.state != states.hitstop)
       {
        //watch out for a potential issue where player returns to wrong state. just in case
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    damage_hitstop = true;
    state = e_state.hitstop;
    /*
    speed = (abs(speed) * hitdir) + (impetus * hitdir);
    direction = 0;
    
    
    if (state != e_state.crash)
       {
        alarm[1] = room_speed * (30/60);
        hitstun = true;
        scr_collision_bounce();
        state = e_state.hitstun;
       }
    */
    //show_debug_message("Hit by the bat! " + string(direction) + " | " + string(speed) + " | " + string(vspeed));   
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit = false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    hp -= (1 + obj_player.chargeOne + (obj_player.chargeTwo*2));
    scr_enemy_hp_zero();
    old_speed = speed;
    impetus = 13 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10) + (instance_exists(melee_hitbox) * 7);
    hitstun_direction = (90-(obj_player.chargeOne*10)-(obj_player.chargeTwo*20)) * hitdir;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (5/60);
    //Player Hitstop
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[9];
    if (obj_player.state != states.hitstop)
       {
        //watch out for a potential issue where player returns to wrong state. just in case
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    damage_hitstop = true;
    state = e_state.hitstop;
    show_debug_message("Hit by launcher. State is now: " + string(state));
    /*speed = (abs(speed) * hitdir) + (impetus * hitdir);
    direction = (90-(obj_player.chargeOne*10)-(obj_player.chargeTwo*20)) * hitdir;
        
    if (state != e_state.crash)
       {
        alarm[1] = room_speed * (25/60);
        hitstun = true;
        scr_collision_bounce();
        state = e_state.hitstun;
       }*/
    //show_debug_message("Hit by the LAUNCHER! " + string(direction) + " | " + string(speed) + " | " + string(vspeed)); 
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
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);
    scr_enemy_hp_zero();
    old_speed = speed;
    if (hitstun == false && place_meeting(x,y+1, obj_boundary))
       {
        impetus = 7;
        hitstun_direction = 60 * hitdir;
        //speed = (abs(speed) * hitdir) + (impetus * hitdir);
        //direction = 60 * hitdir;
       }
    else
       {
        impetus = 7;
        hitstun_direction = -60 * hitdir;
        //speed = (abs(speed) * hitdir) + (impetus * hitdir);
        //direction = -60 * hitdir;
       }
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (3/60);
    
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
    damage_hitstop = true;
    state = e_state.hitstop;
    /*if (state != e_state.crash)
       {
        alarm[1] = room_speed * (12/60);
        hitstun = true;
        scr_collision_bounce();
        state = e_state.hitstun;
       }*/
   }

if (place_meeting(x,y,obj_bunt_bat) && hitstun == false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    hp -= 1;
    scr_enemy_hp_zero();
    old_speed = speed;
    impetus = 4;
    hitstun_direction = 20 * hitdir;
    old_state = state;
    alarm[7] = -1;
    alarm[9] = room_speed * (3/60);
    //Player Hitstop
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = alarm[9];
    if (obj_player.state != states.hitstop)
       {
        //watch out for a potential issue where player returns to wrong state. just in case
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    damage_hitstop = true;
    state = e_state.hitstop;
    //speed = ((abs(speed)*hitdir) * .7) + (impetus*hitdir);
    //direction = 20 * hitdir;
    /*hp -= 1;
    if (state != e_state.crash)
       {
        alarm[1] = room_speed * (12/60);
        hitstun = true;
        scr_collision_bounce();
        state = e_state.hitstun;
       }*/
   }    
   
//Out of HP
//scr_enemy_hp_zero();                
