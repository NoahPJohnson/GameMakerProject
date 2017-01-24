///Enemy Chase
if (obj_player.state = states.knockback)
   {
    dir = 0; 
   }
   
vspd = (min(7, vspd + grv));
if (alarm[0] = -1)
   {
    alarm[0] = firSpeed; 
   }

if (jumping = true)
   {
    if (alarm[5] = -1)
       {
        alarm[5] = 94;
       }
   }     

if (distance_to_object(obj_player) > 444)
   {
    alarm[0] = -1;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 105)
   {
    alarm[0] = -1;
    //hspd = dir * (chsSpeed + 1);
   }
if (distance_to_object(obj_player) < 64)
   {
    if (alarm[7] = -1 && alarm[8] = -1)
       {
        hspd = 0;
        dir = sign(obj_player.x - x);
        if (dir < 0)
           {
            melee_hitbox = instance_create(x-24, y, obj_enemy_melee);
           }
        else
           {
            melee_hitbox = instance_create(x+24, y, obj_enemy_melee);
           }     
        alarm[7] = 10;
       }
    if (instance_exists(melee_hitbox))
       {   
        melee_hitbox.x += hspd;   
       }
   }
else 
   {
    if (instance_exists(melee_hitbox))
       {   
        melee_hitbox.alarm[0] = 1;
       }
    if (obj_player.sliding = false)
       { 
        dir = sign(obj_player.x - x);
       }
    if (firing = false)
       {
        hspd = dir * chsSpeed;
       }  
   }
   
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat   
scr_hit_by_bat();

//Hit by a Projectile
scr_hit_by_projectile();

//Out of HP
scr_enemy_hp_zero();

//Collision with Enemy
scr_enemy_collision();

//Collision
scr_collision();
