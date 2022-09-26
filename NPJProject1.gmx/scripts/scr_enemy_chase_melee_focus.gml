///Enemy Chase Based on conditions
//General Settings
//switch between approach and retreet after each attack regardless of success
   
vspd = (min(12, vspd + grv));
if (alarm[7] = -1 && alarm[8] = -1)
   {
    follow_up_attack = false;
    if (firing = false)
       {
        hspd = dir * chsSpeed;
       }
   }
   
          
//Fire when in long range mode
if (longRange == true)
   {
    //show_debug_message("Long Range is true.");
    chsSpeed = chsSpeed_LR;
    //If player gets too far
    if (distance_to_object(obj_player) > 340 && longRange == true)
       {
        //Begin approach
        dir = sign(obj_player.x - x);
       }
    else if (distance_to_object(obj_player) < 248 && longRange == true && !collision_line(x, y, obj_player.x, obj_player.y, obj_boundary, false, true))
       {
        longRange = false;
       }
    //Otherwise, when in long range maintain a distance from the player
    else if (distance_to_object(obj_player) < 320 && longRange == true)
       {
        if (y < obj_player.y - 32)
           {
            dir = sign(sign(floor(obj_player.x+86) - x) + sign(floor(obj_player.x+92) - x));
           }
        else
           {
            if (obj_player.sliding == false)
               {
                if (abs((obj_player.x+320) - x) < abs((obj_player.x-320) - x))
                   {
                    dir = sign(sign(floor(obj_player.x+310) - x) + sign(floor(obj_player.x+320) - x));
                    //show_debug_message("direction = " + string(dir));
                   }
                else
                   {
                    dir = sign(sign(floor(obj_player.x-310) - x) + sign(floor(obj_player.x-320) - x));
                    //show_debug_message("DIRECTION = " + string(dir));
                   }
               }
           } 
       }
   }    
else
   {
    if (obj_player.sliding == false)
       {
        if (abs((obj_player.x+80) - x) < abs((obj_player.x-80) - x))
           {
            dir = sign(sign(floor(obj_player.x+76) - x) + sign(floor(obj_player.x+84) - x));
            //show_debug_message("direction = " + string(dir));
           }
        else
           {
            dir = sign(sign(floor(obj_player.x-76) - x) + sign(floor(obj_player.x-84) - x));
            //show_debug_message("DIRECTION = " + string(dir));
           }
       }
    if (meleeAttack == false && (collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) || collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true)))
       {
        longRange = true;
       }
    
    chsSpeed = chsSpeed_CR;
   }

if (longRange == true)
   {
    if (distance_to_object(obj_player) < 360)
       {
        if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
           {
            alarm[0] = room_speed * (firSpeed/60);
           } 
       }
   }
else
   {
    if (alarm[0] > 0)
       {
        alarm[0] = -1;
       }
    if (alarm[2] > 0)
       {
        alarm[2] = -1;
       }
   }    

if (distance_to_object(obj_player) > 550)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 100)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (meleeAttack == false)
       {
        hspd = dir * chsSpeed;
       } 
   }
   
//Don't walk off tall ledges   
if (!place_meeting(x+(28 * sign(dir)), (y+30), obj_boundary) && !place_meeting(x, (y+1), obj_player) && antiAir == false)
   {
    hspd *= 0;
   } 
   
//Melee Attack
scr_melee_focus();
  
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
