///Enemy Chase Based on conditions
//General Settings
if (obj_player.state == states.knockback && switched == false)
   {
    switched = true;
    dir = 0;
    //Switch modes when player is in knockback state.
    if (longRange == true)
       {
        //show_debug_message("player hit: switch to close range mode");
        longRange = false;
       }
    else/* if (meleeAttack == false)*/
       {
        //show_debug_message("player hit: switch to long range mode");
        longRange = true;
       } 
   }
else if (obj_player.state != states.knockback && switched == true)
   {
    switched = false;
   }
  
   
vspd = (min(7, vspd + grv));
if (alarm[7] = -1 && alarm[8] = -1)
   {
    if (firing = false)
       {
        hspd = dir * chsSpeed;
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
   
          
//Fire when in long range mode
if (longRange == true)
   {
    //meleeAttack = false;
    chsSpeed = chsSpeed_LR;
    //If player gets too far
    if (distance_to_object(obj_player) > 380 && longRange == true)
       {
        //Begin approach
        dir = sign(obj_player.x - x);
       }
     //If player gets too close, switch modes.
    else if (distance_to_object(obj_player) < 148 && abs(obj_player.y -y) < 28 && longRange == true && switched == false)
       {
        //show_debug_message("Too close: stop shooting and switch to close range");
        longRange = false;
        alarm[0] = -1;
        alarm[2] = -1;
        firing = false;
       }
    //Otherwise, when in long range maintain a distance from the player
    else if (distance_to_object(obj_player) < 360 && longRange == true)
       {
        if (y < obj_player.y - 32)
           {
            dir = sign(obj_player.x - x);
           }
        else
           {
            if (obj_player.sliding = false)
               {
                if (abs((obj_player.x+360) - x) < abs((obj_player.x-360) - x))
                   {
                    dir = sign(sign(floor(obj_player.x+348) - x) + sign(floor(obj_player.x+360) - x));
                    //show_debug_message("direction = " + string(dir));
                   }
                else
                   {
                    dir = sign(sign(floor(obj_player.x-348) - x) + sign(floor(obj_player.x-360) - x));
                    //show_debug_message("DIRECTION = " + string(dir));
                   }
               }
           } 
       }
    if (alarm[0] = -1 && firing = false && longRange = true)
       {
        if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
           {
            alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
            first_shot = false;  
           }
       }
   }    
else
   {
    //sprite_index = spr_enemy_jump;
    if (obj_player.sliding == false)
       {
        if (abs((obj_player.x+120) - x) < abs((obj_player.x-120) - x))
           {
            dir = sign((obj_player.x+120) - x);
            //show_debug_message("direction = " + string(dir));
           }
        else
           {
            dir = sign((obj_player.x-120) - x);
            //show_debug_message("DIRECTION = " + string(dir));
           }
       }
    chsSpeed = chsSpeed_CR;
   } 
   
//Override prior direction if recovering from anti air attack
if (antiAir == true && meleeAttack == false) 
{
    if (!place_meeting(x, y+1, obj_boundary))
    {
        dir = 0;
        show_debug_message("Stop and fall after anti air");
    }
    else
    {
        antiAir = false;
    }
}

if (obj_player.y < y-60 && obj_player.jumping == false && longRange == false)
   {
    longRange = true;
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
    if (sign(dir) == sign(obj_player.x - x))
    {
        longRange = true;
    }
    
    //show_debug_message("Don't walk off ledge.");
    hspd *= 0;
   }
   
//Melee Attack
scr_melee_conditional();
  
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
