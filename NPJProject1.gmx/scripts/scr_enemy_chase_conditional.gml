///Enemy Chase Based on conditions
//General Settings
if (obj_player.state = states.knockback)
   {
    dir = 0;
    //Switch modes when player is in knockback state.
    if (longRange = true)
       {
        longRange = false;
       }
    else if (meleeAttack = false)
       {
        longRange = true;
       } 
   }
//Don't walk off tall ledges   
/*if (!place_meeting((x-dir), (y+1), obj_boundary))
   {
    dir *= -1;
   }  */ 
   
vspd = (min(7, vspd + grv));
if (alarm[7] = -1 && alarm[8] = -1)
   {
    if (firing = false)
       {
        hspd = dir * chsSpeed;
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
   
          
//Fire when in long range mode
if (longRange = true)
   {
    sprite_index = spr_enemy_smart;
    chsSpeed = 1.5;
    //If player gets too far
    if (distance_to_object(obj_player) > 384 && longRange = true)
       {
        //Begin approach
        longRange = false;
        alarm[0] = -1;
        alarm[2] = -1;
        firing = false;
        //dir = sign(obj_player.x - x);
       }
    //Otherwise, when in long range maintain a distance from the player
    else if (distance_to_object(obj_player) < 320 && longRange = true)
       {
        if (obj_player.sliding = false)
           {
            dir = -sign(obj_player.x - x);
           } 
       }
    //If player gets too close, switch modes.
    else if (distance_to_object(obj_player) < 112 && longRange = true)
       {
        longRange = false;
        alarm[0] = -1;
        alarm[2] = -1;
        firing = false;
       }
    
    if (alarm[0] = -1 && firing = false && longRange = true)
       {
        alarm[0] = room_speed * ((firSpeed/60) * (1+first_shot)); 
       }
   }    
else if (longRange = false)
   {
    sprite_index = spr_enemy_jump;
    if (obj_player.sliding = false)
       {
        dir = sign(obj_player.x - x);
       }
    chsSpeed = 4;
   }

//Can jump up large obsticals
/*if (place_meeting(x,y+1, obj_boundary) && place_meeting(x+(dir * 64),y+32, obj_boundary) && !place_meeting(x+(dir), (y-100), obj_boundary))
   {
    if (alarm[5] = -1)
       {
        alarm[5] = 30;
       }
   }*/        

if (distance_to_object(obj_player) > 444)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    state = e_state.idle;
   }
   
if (distance_to_object(obj_player) < 80)
   {
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (meleeAttack = false)
       {
        hspd = dir * chsSpeed;
       } 
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
scr_enemy_hp_zero();

//Collision with Enemy
scr_enemy_collision();

//Collision
scr_collision();
