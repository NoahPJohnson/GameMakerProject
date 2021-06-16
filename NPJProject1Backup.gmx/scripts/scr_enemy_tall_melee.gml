//Melee Attack
if (!instance_exists(shield))
   {
    //show_debug_message("spawn shield.");
    shield = instance_create(x, y, obj_enemy_shield);
    shield.enemy_parent = self;
   }
if (instance_exists(melee_hitbox))
   {   
    melee_hitbox.x += hspd;  
   }
//Lunge Melee
if (distance_to_object(obj_player) < 150 && !collision_line(shield.enemy_parent.x,shield.enemy_parent.y,obj_player.x,obj_player.y,obj_boundary,false,true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && obj_player.state != states.sliding && obj_player.state != states.knockback && place_meeting(x,y+1,obj_boundary))
   {
    //show_debug_message("Tall is ready.");
    //show_debug_message("Alarm 7 = " + string(alarm[7]) + " and Alarm 8 = " + string(alarm[8]));
    
    if (alarm[7] = -1 && alarm[8] = -1)
       {
        //meleeAttack = true;
        //show_debug_message("Tall is preparing.")
        hspd = 0;
        melee_dir = sign(obj_player.x - x);
        
        if (obj_player.y+32 < y)
           {
            //antiAir = true;
            alarm[7] = room_speed * (45/60);
            thrust_height = -48;
            //show_debug_message("upper stab");
           }
        else if (obj_player.y+32 <= y+16)
           {
            
            alarm[7] = room_speed * (45/60);
            thrust_height = -16;
            //show_debug_message("middle stab");
           }
        else if (obj_player.y+32 <= y+48 && obj_player.crouching == true)
           {
            alarm[7] = room_speed * (45/60);
            thrust_height = 16;
            //show_debug_message("low stab");
           }
        else if (obj_player.y+32 <= y+48)
           {
            
            alarm[7] = room_speed * (45/60);
            thrust_height = -16;
            //show_debug_message("middle stab");
           }
        else //if (obj_player.y+32 > y+48)
           {
            alarm[7] = room_speed * (45/60);
            thrust_height = 16;
            //show_debug_message("low stab");
           }
        
       }
   }
else if (alarm[7] = -1 && alarm[8] > 0 && !instance_exists(melee_hitbox) && meleeAttack == true)
   {
    hspd = 0;
   }
else if (obj_player.state == states.knockback)
   {
    alarm[7] = -1;
    alarm[8] = -1;
   }
 
