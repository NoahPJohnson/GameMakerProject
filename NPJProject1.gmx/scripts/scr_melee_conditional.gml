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
    if (distance_to_object(obj_player) < 120 && obj_player.state != states.sliding && obj_player.state != states.knockback && meleeAttack == false)
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
            melee_dir = sign(obj_player.x - x);
            if (obj_player.jumping = true)
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
 
