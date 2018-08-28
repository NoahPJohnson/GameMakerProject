//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (longRange == false)
   {
    //Lunge Melee
    //meleeAttack = true;
    if (distance_to_object(obj_player) < 104 && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.sliding && obj_player.state != states.knockback && meleeAttack == false && place_meeting(x,y+1,obj_boundary))
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
            melee_dir = sign(obj_player.x - x);
            if (obj_player.jumping = true || obj_player.y < y-60)
               {
                antiAir = true;
                alarm[7] = room_speed * (18/60);
                show_debug_message("Anti Air Slice in 18");
               }
            else
               {
                antiAir = false;
                alarm[7] = room_speed * (26/60);
                show_debug_message("Normal Slice in 28");
               }
           }
       }
    else if (alarm[7] = -1 && alarm[8] > 0 && !instance_exists(melee_hitbox) && meleeAttack == true)
       {
        hspd = 0;
       }
    else if (alarm[7] = -1 && alarm[8] = -1 && meleeAttack == true && follow_up_attack == false)
       {
        meleeAttack = false;
        if (instance_exists(melee_hitbox))
           {   
            melee_hitbox.alarm[0] = 1;
           }
       }
    else if (obj_player.state = states.knockback)
       {
           alarm[7] = -1;
           alarm[8] = -1;
       }
   }
 
