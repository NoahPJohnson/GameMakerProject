///Neutral state
if (enemy_parent != noone)
   {
    if (enemy_parent.state != e_state.chase)
       {
        instance_destroy();
       }
if (obj_player.sliding == false)
   { 
    if (obj_player.y < enemy_parent.y-160 && guard_position != 1 && alarm[1] == -1)
       {
        show_debug_message("GUARD UP! player y = " + string(obj_player.y) + " enemy y = " + string(enemy_parent.y-160));
        old_X = x;
        old_Y = y;
        x = enemy_parent.x;
        y = enemy_parent.y-48;
        old_sprite = sprite_index;
        sprite_index = spr_enemy_shield_Up;
        if (!place_meeting(x,y,obj_player))
           {
            
            sprite_index = old_sprite;
            if (alarm[1] == -1)
               {
                guard_position = 1;
                alarm[1] = room_speed * (25/60);
               }
           }
        x = old_X;
        y = old_Y;
        sprite_index = old_sprite;
       }
    else if (obj_player.y > enemy_parent.y-16 && obj_player.x < enemy_parent.x-32 && guard_position != 0 && alarm[1] == -1)
       {
        show_debug_message("Guard Left.");
        old_X = x;
        old_Y = y;
        x = enemy_parent.x - 48;
        y = enemy_parent.y-48;
        old_sprite = sprite_index;
        sprite_index = spr_enemy_shield_L;
        if (!place_meeting(x,y,obj_player))
           {
            sprite_index = old_sprite;
            if (alarm[1] == -1)
               {
                guard_position = 0;
                alarm[1] = room_speed * (25/60);
               }
           }
        x = old_X;
        y = old_Y;
        sprite_index = old_sprite;
        /*if (alarm[1] == -1)
           {
            guard_position = 0;
            alarm[1] = room_speed * (55/60);
           }*/
       }
    else if (obj_player.y > enemy_parent.y-16 && obj_player.x > enemy_parent.x+32 && guard_position != 2 && alarm[1] == -1)
       {
        show_debug_message("guard right");
        old_X = x;
        old_Y = y;
        x = enemy_parent.x + 48;
        y = enemy_parent.y-48;
        old_sprite = sprite_index;
        sprite_index = spr_enemy_shield_R;
        if (!place_meeting(x,y,obj_player))
           {
            sprite_index = old_sprite;
            if (alarm[1] == -1)
               {
                guard_position = 2;
                alarm[1] = room_speed * (25/60);
               }
           }
        x = old_X;
        y = old_Y;
        sprite_index = old_sprite;
        /*if (alarm[1] == -1)
           {
            guard_position = 2;
            alarm[1] = room_speed * (55/60);
           }*/
       }
   }
    if (place_meeting(x,y,obj_player) && alarm[1] == -1)
       {
        show_debug_message("Shield Avoid Overlap. guard_position = " + string(guard_position));
        guard_position -= 1;
        if (guard_position < 0)
           {
            guard_position = 2;
           }
        if (guard_position == 0)
           {
            sprite_index = spr_enemy_shield_L;
            x = enemy_parent.x - 48;
            y = enemy_parent.y-48;
           }
        else if (guard_position == 1)
           {
            sprite_index = spr_enemy_shield_Up;
            x = enemy_parent.x;
            y = enemy_parent.y-48;
           }
        else if (guard_position == 2)
           {
            sprite_index = spr_enemy_shield_R;
            x = enemy_parent.x + 48;
            y = enemy_parent.y-48;
           }
        //alarm[1] = 0;
       }
       
       
    if (sprite_index == spr_enemy_shield_L)
       {
        //sprite_index = spr_enemy_shield_L;
        x = enemy_parent.x - 48;
        y = enemy_parent.y-48;
       }
    else if (sprite_index == spr_enemy_shield_Up)
       {
        //sprite_index = spr_enemy_shield_Up;
        x = enemy_parent.x;
        y = enemy_parent.y-48;
       }
    else if (sprite_index == spr_enemy_shield_R)
       {
        //sprite_index = spr_enemy_shield_R;
        x = enemy_parent.x + 48;
        y = enemy_parent.y-48;
       }
    //x = enemy_parent.x + (32);
    //y = enemy_parent.y-100; 
   }

//Blocked by Bunt
/*if (place_meeting(x,y,obj_bunt_bat))
   {
    obj_player.sp -= 30;
    
    //Player Hitstop
    obj_player.hitstop = false;
    obj_player.damage_hitstop = false;
    obj_player.alarm[11] = room_speed * (3/60);
    if (obj_player.state != states.hitstop)
       {
        obj_player.old_state = obj_player.state;
       }
    obj_player.state = states.hitstop;
    
    //Enemy Hitstop
    enemy_parent.hitstop = false;
    enemy_parent.damage_hitstop = false;
    enemy_parent.alarm[9] = room_speed * (3/60);
    enemy_parent.old_state = enemy_parent.state;
    enemy_parent.state = e_state.hitstop;
    //instance_destroy();
   }*/


   
//scr_shield_hit_by_bat();
