///scr_enemy
speed = 0;
direction = 0;
hspd = 0;
vspd = (min(12, vspd + grv));

if (distance_to_object(obj_player) < 500) 
   {
    //show_debug_message("Within distance.")
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false))
       {
        //show_debug_message("clear line of sight!");
        first_shot = true;
        state = e_state.chase;
       }
   }

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
