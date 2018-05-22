///Enemy Chase
if (obj_player.sliding = false)
   { 
    dir = sign(obj_player.x - x);
   } 

if (obj_player.state = states.knockback)
   {
    dir = 0; 
   }
   
if (alarm[0] == -1 && firing == false)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false))
       {
        alarm[0] = room_speed * ((fir_speed/60) / (1+first_shot));
        first_shot = false;
       } 
   }
     
if (distance_to_object(obj_player) > 550)
   {
    alarm[0] = -1;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 95 && alarm[0] > -1)
   {
    alarm[0] = -1;
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
