///Enemy Chase
speed = 0;
direction = 0;
if (obj_player.state == states.knockback)
   {
    dir = 0;
    alarm[0] = -1; 
   }
   
if (jumping_type == true)
   {
    if (alarm[7] > 0 && meleeAttack == true)
       {
        vspd = 0;   
       }
    else if (alarm[7] == -1 && meleeAttack == true)
       {
        vspd = (min(5, vspd));
       }
    else
       {
        vspd = (min(7, vspd + grv));
       }
   }
else 
   {
    vspd = (min(7, vspd + grv));
   }
if (/*alarm[7] = -1 && */alarm[8] = -1)
   {
    if (obj_player.sliding == false && jumping_type == false)
       {
        if (abs(obj_player.y - y) < 108 && obj_player.jumping == false && !collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
           {
            if (abs((obj_player.x+120) - x) < abs((obj_player.x-120) - x))
               {
                //dir = sign((obj_player.x+120) - x);
                dir = sign(sign(floor(obj_player.x+108) - x) + sign(floor(obj_player.x+120) - x));
                //show_debug_message("direction = " + string(dir));
               }
            else
               {
                //dir = sign((obj_player.x-120) - x);
                dir = sign(sign(floor(obj_player.x-108) - x) + sign(floor(obj_player.x-120) - x));
                //show_debug_message("DIRECTION = " + string(dir));
               }
           }
        else
           {
            if (abs((obj_player.x+200) - x) < abs((obj_player.x-200) - x))
               {
                //dir = sign((obj_player.x+120) - x);
                dir = sign(sign(floor(obj_player.x+180) - x) + sign(floor(obj_player.x+200) - x));
                //show_debug_message("direction = " + string(dir));
               }
            else
               {
                //dir = sign((obj_player.x-120) - x);
                dir = sign(sign(floor(obj_player.x-180) - x) + sign(floor(obj_player.x-200) - x));
                //show_debug_message("DIRECTION = " + string(dir));
               }
           }
        if (firing == false)
           {
            hspd = dir * chsSpeed;
           } 
       }
    else if (obj_player.sliding == false && jumping_type == true)
       {
        if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
           {
            if (abs((obj_player.x+78) - x) < abs((obj_player.x-78) - x))
               {
                dir = sign(sign(floor(obj_player.x+70) - x) + sign(floor(obj_player.x+78) - x));
               }
            else
               {
                dir = sign(sign(floor(obj_player.x-70) - x) + sign(floor(obj_player.x-78) - x));
               }
           }
        else 
           {
            if (abs((obj_player.x+160) - x) < abs((obj_player.x-160) - x))
               {
                dir = sign(sign(floor(obj_player.x+150) - x) + sign(floor(obj_player.x+160) - x));
               }
            else
               {
                dir = sign(sign(floor(obj_player.x-150) - x) + sign(floor(obj_player.x-160) - x));
               }
           }
        if (firing == false && meleeAttack == false && jumped == false)
           {
            hspd = dir * chsSpeed;
           }
       }
   } 
if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
       {
        alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
        first_shot = false; 
       }
   }
   
if (jumping_type == true)
   {
    if ((place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && alarm[5] > 0)
       {
        chsSpeed = 1.5;
        jumping = false;
       }
    if (jumped == true)
       {
        if ((place_meeting(x,y+1, obj_boundary) || place_meeting(x,y+1,obj_player)))
           {
            hspd = 0;
            if (instance_exists(melee_hitbox))
               {   
                melee_hitbox.alarm[0] = room_speed * (1/60);
               }
            meleeAttack = false;
            
            if (!place_meeting(x,y+1,obj_player) && alarm[6] == -1)
               {
                alarm[6] = room_speed * (90/60);
               }
            else if (alarm[6] == -1)
               {
                jumped = false;
               }
           }
       }
    else
       {
        if (place_meeting(x,y+1, obj_player) && alarm[5] == -1)
           {
            alarm[5] = room_speed * (22/60);
           }   
        else if (place_meeting(x,y+1, obj_boundary) && alarm[5] == -1)
           {
            alarm[5] = room_speed * (94/60);
           }
       }
   }     

if (distance_to_object(obj_player) > 550)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    alarm[5] = -1;
    alarm[7] = -1;
    firing = false;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 128)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (jumping_type = true)
       {
        if (place_meeting(x, y+1, obj_boundary) && jumped = false && abs(obj_player.y - y) < 108)
           {
            alarm[5] = 1;
           }
       }
   }
   
//Melee Attack
scr_enemy_melee();
  
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat   
scr_hit_by_bat();

//Hit by a Projectile
scr_hit_by_projectile();

//Out of HP
//scr_enemy_hp_zero();

//Collision with Enemy
//scr_enemy_collision();

//Collision
scr_collision();
