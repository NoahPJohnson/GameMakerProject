//Melee Attack
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    melee_hitbox.y = y;  
   }
if (jumping = false)
   {
    //Lunge Melee
    //meleeAttack = true;
    if (distance_to_object(obj_player) < 80 && place_meeting(x,y+1,obj_boundary) /*&& obj_player.state != states.sliding*/ && obj_player.state != states.knockback && meleeAttack = false)
       {
        meleeAttack = true;
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            hspd = 0;
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
            alarm[7] = room_speed * (20/60);
           }
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
   }
else
   {
    //Divekick Melee
    if (distance_to_object(obj_player) < 80 && !place_meeting(x, y+64, obj_boundary) && obj_player.state != states.sliding && obj_player.state != states.knockback)
       {
        if (alarm[7] = -1 && alarm[8] = -1)
           {
            jumped = true;
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
