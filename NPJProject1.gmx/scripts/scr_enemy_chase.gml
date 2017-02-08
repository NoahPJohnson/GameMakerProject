///Enemy Chase
if (obj_player.state = states.knockback)
   {
    dir = 0; 
   }
   
vspd = (min(7, vspd + grv));
if (alarm[0] = -1 && firing = false)
   {
    alarm[0] = firSpeed; 
   }

if (jumping = true)
   {
    if (place_meeting(x,y+1, obj_boundary) && jumped = true)
       {
        hspd = 0;
        chsSpeed = 0;
        //sprite_index = spr_player_charging;
        if (alarm[6] = -1)
           {
            alarm[6] = 60;
           }
       }   
    if (alarm[5] = -1)
       {
        alarm[5] = 94;
       }
   }     

if (distance_to_object(obj_player) > 444)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 128)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    if (jumping = true)
       {
        if (place_meeting(x, y+1, obj_boundary) && jumped = false)
           {
            alarm[5] = 1;
           }
       }
    //hspd = dir * (chsSpeed + 1);
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
scr_enemy_hp_zero();

//Collision with Enemy
scr_enemy_collision();

//Collision
scr_collision();
