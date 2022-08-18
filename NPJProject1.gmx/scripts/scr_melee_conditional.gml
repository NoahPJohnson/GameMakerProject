//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (longRange == false && (place_meeting(x,y+1,obj_boundary)))
   {
    //Lunge Melee
    //meleeAttack = true;
    if (distance_to_object(obj_player) < 120 && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.sliding && obj_player.state != states.knockback && meleeAttack == false)
       {
        show_debug_message("Melee Attack is true");
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
            melee_dir = sign(obj_player.x - x);
            if (obj_player.y < y-16 && obj_player.jumping == true)
               {
                antiAir = true;
                alarm[7] = room_speed * (6/60);
               }
            else
               {
                antiAir = false;
                alarm[7] = room_speed * (30/60);
               }
           }
       }
    else if (alarm[7] = -1 && alarm[8] > 0 && !instance_exists(melee_hitbox) && meleeAttack == true)
       {
        hspd = 0;
       }
    else if (alarm[7] = -1 && alarm[8] = -1 && meleeAttack == true)
       {
        show_debug_message("Melee Attack is F A L S E");
        meleeAttack = false;
        if (instance_exists(melee_hitbox))
           {   
            melee_hitbox.alarm[0] = 1;
           }
       }
    /*else if (obj_player.state = states.knockback)
       {
           alarm[7] = -1;
           alarm[8] = -1;
       }*/
   }
 
