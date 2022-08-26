///Enemy Chase
speed = 0;
direction = 0;
if (obj_player.state == states.knockback)
   {
    dir = 0;
    alarm[0] = -1; 
   }
   
vspd = (min(7, vspd + grv));
if (/*alarm[7] = -1 && */alarm[8] = -1)
   {
    if (obj_player.sliding == false && jumping_type == false)
       {
        if (abs(obj_player.y - y) < 170)
           {
            
            if (abs((obj_player.x+150) - x) < abs((obj_player.x-150) - x))
               {
                dir = sign(sign(floor(obj_player.x+150) - x) + sign(floor(obj_player.x+160) - x));
                
                //show_debug_message("direction = " + string(dir));
               }
            else
               {
                dir = sign(sign(floor(obj_player.x-150) - x) + sign(floor(obj_player.x-160) - x));
                //show_debug_message("DIRECTION = " + string(dir));
               }
           }
        else
           {
            dir = sign((obj_player.x) - x);
           } 
       }
    if (firing == false)
       {
        step += room_speed * (0.1/60);
        //show_debug_message("Step: " + string(sin(step)));
        hspd = dir * (chsSpeed + sin(step));
       }
    else 
       {
        step = 0;
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
   
if (distance_to_object(obj_player) < 150)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
   }
   
//Melee Attack
scr_enemy_ball_melee();
  
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat
if (armored == false)
   {   
    scr_hit_by_bat();
   }
else
   {
    scr_hit_by_bat_armored();
   }

//Hit by a Projectile
if (armored == false)
   {  
    scr_hit_by_projectile();
   }
else
   {
    scr_hit_by_projectile_armored();
   }

//Out of HP
//scr_enemy_hp_zero();

//Collision with Enemy
//scr_enemy_collision();

//Collision
scr_collision();
