//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (jumping_type = false)
   {
    //Lunge Melee
    //meleeAttack = true;
    if (distance_to_object(obj_player) < 120 && (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && obj_player.state != states.knockback && meleeAttack = false)
       {
        //sprite_index = spr_player_charging;
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            //hspd = 0;
            
            //if (obj_player.state != states.sliding)
            //   {
                melee_dir = sign(obj_player.x - x);
            //   }
            //show_debug_message("Dir = " + string(dir));
            /*dir = sign(obj_player.x - x);
            if (dir < 0)
               {
                melee_hitbox = instance_create(x-32, y, obj_enemy_melee);
                xoffset = -24;
               }
            else
               {
                melee_hitbox = instance_create(x+32, y, obj_enemy_melee);
                xoffset = 24;
               }*/     
            alarm[7] = room_speed * (35/60);
           }
       }
    else if (alarm[7] = -1 && alarm[8] > 0 && !instance_exists(melee_hitbox) && meleeAttack = true)
       {
        hspd = 0;
       }
    else if (alarm[7] = -1 && alarm[8] = -1 && meleeAttack = true)
       {
        meleeAttack = false;
        if (instance_exists(melee_hitbox))
           {   
            melee_hitbox.alarm[0] = 1;
           }
        //StartRecovery
        /*if (obj_player.sliding = false)
           { 
            dir = sign(obj_player.x - x);
           }
        if (firing = false)
           {
            hspd = dir * chsSpeed;
           }*/  
       }
    else if ((!place_meeting(x,y+1,obj_boundary) && !place_meeting(x,y+1,obj_player)) || obj_player.state = states.knockback)
       {
           alarm[7] = -1;
           alarm[8] = -1;
       }
   }
else
   {
    //Divekick Melee
    if (distance_to_object(obj_player) < 80 && !collision_line(x,y,x,y+130,obj_boundary,false,true) && obj_player.state != states.sliding && obj_player.state != states.knockback)
       {
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            //jumped = true;
            hspd = 0;
            vspd = 0;
            grv = 0;
            alarm[7] = room_speed * (10/60);
           }    
       }
    else if (alarm[7] = -1 && alarm[8] = -1)
       {
        if (instance_exists(melee_hitbox))
           {   
            melee_hitbox.alarm[0] = 1;
           }
        /*if (obj_player.sliding = false)
           { 
            dir = sign(obj_player.x - x);
           }
        if (firing = false)
           {
            hspd = dir * chsSpeed;
           }*/  
       }   
   } 
