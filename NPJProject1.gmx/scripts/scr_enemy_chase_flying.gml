///Enemy Chase
speed = 0;
direction = 0;

//bob += room_speed * (0.1/60);
//vspd = (2*sin(bob));
//if (melee_hitbox != obj_projectile_bomb_2)
//   {
    if (collision_line(x,y,x,y+130,obj_boundary,false,true) && !place_meeting(x+hspd,y-64, obj_boundary))
       {
        vspd = -4;
        show_debug_message("Go up.");
       }
    else if (!place_meeting(x+hspd,y+130, obj_boundary) && place_meeting(x+hspd,y-24, obj_boundary))
       {
        vspd = 3;
        show_debug_message("Go DOWN.");
       }
    else if (/*!place_meeting(x+hspd,y+220, obj_boundary)*/!collision_line(x,y,x,y+240,obj_boundary,false,true))
       {
        vspd = 3;
        show_debug_message("Too high, descend.");
       }
    else
       {
        //vspd = 0;
        bob += room_speed * (0.1/60);
        vspd = (3*sin(bob));
        show_debug_message("Ok! Just bob up and down.");
       }
//   }
//else
//   {
//    bob += room_speed * (0.1/60);
//    vspd = (2*sin(bob));
//   }

//vspd = (min(7, vspd + grv));
if (/*alarm[7] = -1 && */alarm[8] = -1)
   {
    if (obj_player.sliding == false)
       {   
        if (abs(obj_player.x - x) > 130)
           {
            selected_projectile = obj_projectile;
            if (abs((obj_player.x+150) - x) < abs((obj_player.x-150) - x))
               {
                dir = sign((obj_player.x-150) - x);
                //show_debug_message("direction = " + string(dir));
               }
            else
               {
                dir = sign((obj_player.x+150) - x);
                //show_debug_message("DIRECTION = " + string(dir));
               }
           }
        else
           {
            if (!collision_line(x,y,x,y+180,obj_boundary,false,true) && collision_line(x,y,x,y+250,obj_boundary,false,true))
               {
                //vspd = ((obj_player.x-x)*-dir)/30;
               }
            selected_projectile = obj_projectile_bomb_2;
           }
       }
    if (firing == false)
       {
        hspd = dir * chsSpeed;
       }
   } 
if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
       {
        if ((abs(obj_player.x - x) < 140) && y < obj_player.y && selected_projectile == obj_projectile_bomb_2)
           {
            //show_debug_message("Drop!");
            
            //melee_hitbox = obj_projectile_bomb_2;
            alarm[0] = room_speed * (((firSpeed)/60) / (1+first_shot));
            //show_debug_message("alarm[0] = " + string(alarm[0]))
           }
        else
           {
            //melee_hitbox = obj_projectile;
            alarm[0] = room_speed * (((firSpeed/2)/60) / (1+first_shot));
           }
        //alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
        first_shot = false; 
       }
   }
   

   
if (dir == -1)
   {
    image_xscale = -1;
   }
else if (dir == 1)
   {
    image_xscale = 1;
   }
   
if (obj_player.state == states.knockback)
   {
    vspd = 0;
    dir = 0;
    alarm[0] = -1; 
   }

   
//Melee Attack
//scr_enemy_melee();
  
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
