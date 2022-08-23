//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (jumping_type = false)
   {
    //Lunge Melee
    if (distance_to_object(obj_player) < 120 && (abs(obj_player.y - y) < 96) && (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.knockback && meleeAttack = false)
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            melee_dir = sign(obj_player.x - x); 
            alarm[7] = room_speed * (35/60);
           }
       }
    else if ((alarm[7] > 0 || alarm[8] > 0) && !instance_exists(melee_hitbox) && meleeAttack = true)
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
       }
   }
else
   {
    //Divekick Melee
    if (distance_to_object(obj_player) < 148 && y < obj_player.y-10 && jumped == false && meleeAttack == false && !place_meeting(x,y+24,obj_boundary) && (!collision_line(x,y,x,y+130,obj_boundary,false,true) || place_meeting(x,y-2,obj_boundary)) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.sliding && obj_player.state != states.knockback)
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
            vspd = 0;
            if (obj_player.state != states.sliding)
               {
                melee_dir = sign(obj_player.x - x);
               }
            alarm[7] = room_speed * (20/60);
           }    
       }  
   } 
