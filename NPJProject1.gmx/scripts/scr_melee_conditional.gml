//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (longRange = false)
   {
    //Lunge Melee
    //meleeAttack = true;
    if (distance_to_object(obj_player) < 80 && obj_player.state != states.sliding && obj_player.state != states.knockback && meleeAttack = false)
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
            if (obj_player.jumping = true)
               {
                antiAir = true;
                alarm[7] = room_speed * (5/60);
               }
            else
               {
                antiAir = false;
                alarm[7] = room_speed * (20/60);
               }
           }
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
 
