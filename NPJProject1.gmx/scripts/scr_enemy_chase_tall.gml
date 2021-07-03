///Enemy Chase
speed = 0;
direction = 0;
if (obj_player.state == states.knockback)
   {
    dir = 0;
    alarm[0] = -1; 
   }
   
vspd = (min(7, vspd + grv));
if (alarm[7] = -1 && alarm[8] = -1)
   {
    if (obj_player.sliding == false)
       {
        if (abs((obj_player.x+180) - x) < abs((obj_player.x-180) - x))
           {
            dir = sign(sign(floor(obj_player.x+170) - x) + sign(floor(obj_player.x+180) - x));
            //show_debug_message("direction = " + string(dir));
           }
        else
           {
            dir = sign(sign(floor(obj_player.x-170) - x) + sign(floor(obj_player.x-180) - x));
            //show_debug_message("DIRECTION = " + string(dir));
           }
       }
       
    if (distance_to_object(obj_player) < 130)
       {
        dir = 0;
       }
    if (firing == false)
       {
        hspd = dir * chsSpeed;
       } 
   } 
if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
       {
        alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
        first_shot = false; 
       }
   }
   
   
/*if (dir == -1)
   {
    image_xscale = -1;
   }
else if (dir == 1)
   {
    image_xscale = 1;
   }*/
    

if (distance_to_object(obj_player) > 590)
   {
    if (instance_exists(melee_hitbox))
       {
        melee_hitbox.alarm[0] = 1;
       }
    alarm[0] = -1;
    alarm[2] = -1;
    alarm[5] = -1;
    alarm[7] = -1;
    firing = false;
    state = e_state.idle;
   }

   
//Melee Attack
scr_enemy_tall_melee();
  
//Valid Target
scr_enemy_targeted();
   
if (shield != noone)
   {
    if (shield.sprite_index == shield.shield_left_sprite && obj_player.x > shield.x)
       {
        //show_debug_message("Player is to the right of shield L");
        //Hit by the Bat  
        scr_hit_by_bat();

        //Hit by a Projectile 
        //scr_hit_by_projectile();
       }
    else if (shield.sprite_index == shield.shield_up_sprite && obj_player.y > shield.y)
       {
        //show_debug_message("Player is below shield Up");
        //Hit by the Bat  
        scr_hit_by_bat();

        //Hit by a Projectile 
        //scr_hit_by_projectile();
       }
    else if (shield.sprite_index == shield.shield_right_sprite && obj_player.x < shield.x)
       {
        //show_debug_message("Player is to the left of shield R");
        //Hit by the Bat  
        scr_hit_by_bat();

        //Hit by a Projectile 
        //scr_hit_by_projectile();
       }
   }
else
   {
    //Hit by the Bat  
    scr_hit_by_bat();

    //Hit by a Projectile 
    //scr_hit_by_projectile();
   }
   
//Hit by a Projectile 
scr_hit_by_projectile();

//Collision
scr_collision();
