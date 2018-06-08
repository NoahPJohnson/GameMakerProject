//Melee Attack
if (!instance_exists(melee_hitbox))
   {
    melee_hitbox = instance_create(x, y-80, obj_enemy_ball_hitbox);
    melee_hitbox.enemy_parent = self;
    melee_hitbox.center_X = x;
    melee_hitbox.center_Y = y;
    spin = 0;
   }
if (instance_exists(melee_hitbox))
   {   
    //spin += room_speed * (0.1/60);
    //melee_hitbox.x += (sin(spin));
    /*if (meleeAttack == false)
       {
        melee_hitbox.x = x + (48*sin(spin));
        melee_hitbox.y = y-100; 
       }
    else
       {
        //melee_hitbox.x = x - (dir * 48);
       }*/
    
      
   }
//Swing Ball n Chain Melee
if (distance_to_object(obj_player) < 190 && (place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && !collision_line(x, y, obj_player.x, obj_player.y, obj_enemy, false, true) && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true) && obj_player.state != states.knockback && meleeAttack == false)
   {
    //sprite_index = spr_player_charging;
    meleeAttack = true;
    if (alarm[7] = -1 && alarm[8] = -1)
       {
        hspd = 0;
            
        //if (obj_player.state != states.sliding)
        //   {
        melee_dir = sign(obj_player.x - x);
        //   }
        //show_debug_message("Dir = " + string(dir));    
        alarm[7] = room_speed * (55/60);
       }
   }
else if (alarm[7] = -1 && alarm[8] > 0 && meleeAttack == true)
   {
    hspd = 0;
   }
else if (alarm[7] = -1 && alarm[8] = -1 && meleeAttack == true)
   {
    meleeAttack = false;
   }
else if ((!place_meeting(x,y+1,obj_boundary) && !place_meeting(x,y+1,obj_player)) || obj_player.state == states.knockback)
   {
    alarm[7] = -1;
    alarm[8] = -1;
   }
