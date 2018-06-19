//Melee Attack
if (!instance_exists(shield))
   {
    shield = instance_create(x, y, obj_enemy_ball_hitbox);
    shield.enemy_parent = self;
    shield.center_X = x;
    shield.center_Y = y;
   }
else
   {
    
   } 
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd; 
    //melee_hitbox.y = y;  
   }
//Lunge Melee
//meleeAttack = true;
if (distance_to_object(obj_player) < 104 && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.sliding && obj_player.state != states.knockback && meleeAttack == false && place_meeting(x,y+1,obj_boundary))
   {
    meleeAttack = true;
    if (alarm[7] = -1 && alarm[8] = -1)
       {
        hspd = 0;
        melee_dir = sign(obj_player.x - x);
        if (obj_player.y < y+32)
           {
            //antiAir = true;
            alarm[7] = room_speed * (20/60);
            show_debug_message("upper stab");
           }
        else if (obj_player.y < y+64)
           {
            alarm[7] = room_speed * (20/60);
            show_debug_message("middle stab");
           }
        else
           {
            //antiAir = false;
            alarm[7] = room_speed * (20/60);
            show_debug_message("low stab");
           }
       }
   }
else if (alarm[7] = -1 && alarm[8] > 0 && !instance_exists(melee_hitbox) && meleeAttack == true)
   {
    hspd = 0;
   }
else if (obj_player.state = states.knockback)
   {
    alarm[7] = -1;
    alarm[8] = -1;
   }
 
