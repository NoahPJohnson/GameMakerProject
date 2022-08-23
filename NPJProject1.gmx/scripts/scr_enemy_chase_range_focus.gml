///Enemy Chase Based on conditions
//General Settings
if (obj_player.state == states.knockback)
{
    dir = 0; 
}
  
   
vspd = (min(7, vspd + grv));
if (firing == false && meleeAttack == false)
{
    //show_debug_message("DIRECTION = " + string(dir));
    hspd = dir * chsSpeed;
}
else if (firing == false && meleeAttack == true)
{
    hspd = dir * 8;
}   
   
          
//Fire bursts when in long range mode
if (longRange == true && meleeAttack == false && jumping == false)
{
    //If player gets too far
    if (distance_to_object(obj_player) > 420 && longRange == true)
    {
        //Begin approach
        dir = sign(obj_player.x - x);
    }
     //If player gets too close, switch modes.
    else if (distance_to_object(obj_player) < 100 && longRange == true && switched == false)
    {
        //show_debug_message("Too close: stop shooting and switch to close range");
        alarm[0] = -1;
        alarm[2] = -1;
        firing = false;
    }
    //Otherwise, when in long range maintain a distance from the player
    else if (distance_to_object(obj_player) < 400 && longRange == true)
    {
        if (y < obj_player.y - 32)
        {
            if (collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false))
            { 
                dir = sign(obj_player.x - x);
            }
        }
        else
        {
            if (obj_player.sliding = false)
            {
                if (abs((obj_player.x+400) - x) < abs((obj_player.x-400) - x))
                {
                    dir = sign(sign(floor(obj_player.x+390) - x) + sign(floor(obj_player.x+400) - x));
                }
                else
                {
                    dir = sign(sign(floor(obj_player.x-390) - x) + sign(floor(obj_player.x-400) - x));
                }
            }
        } 
    }
}    
else if (longRange == false && meleeAttack == false && jumping == false)
{
    //sprite_index = spr_enemy_jump;
    if (obj_player.sliding = false)
    {
        if (abs((obj_player.x+200) - x) < abs((obj_player.x-200) - x))
        {
            dir = sign(sign(floor(obj_player.x+180) - x) + sign(floor(obj_player.x+200) - x));
        }
        else
        {
            dir = sign(sign(floor(obj_player.x-180) - x) + sign(floor(obj_player.x-200) - x));
        }
    }
}

if (alarm[0] == -1 && firing == false && meleeAttack == false)
{
    alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
    first_shot = false; 
}

if (obj_player.y < y-60 && obj_player.jumping == false && longRange == false)
{
    longRange = true;
}
   
//Avoid Grenades
if (instance_exists(obj_projectile_grenade) && jumping == false && meleeAttack == false)
{
    if (distance_to_object(obj_projectile_grenade) < 200)
    {
        //show_debug_message("Run!!");
        dir = -sign(obj_projectile_grenade.x - x);
    }
}    
   
if (jumping_type == true)
{
    if (jumping == false)
    {
        chsSpeed = chsSpeed_LR;
    }
    if ((place_meeting(x,y+1,obj_boundary) || place_meeting(x,y+1,obj_player)) && jumping == true && vspd >= 0)
    {
        jumping = false;
        chsSpeed = chsSpeed_LR;
    }
    else if (place_meeting(x,y+1, obj_player))
    {
        alarm[5] = 1;
    }   
}  
      

if (distance_to_object(obj_player) > 580)
{
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    meleeAttack = false;
    state = e_state.idle;
}
   
if (distance_to_object(obj_player) < 120 && meleeAttack == false && jumping = false)
{
    alarm[0] = -1;
    alarm[2] = -1;
    firing = false;
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
    {
        if (place_meeting(x - (sign(obj_player.x - x)*8),y,obj_boundary))
        {
            if (obj_player.sliding = false)
            {
                if (alarm[5] == -1)
                {
                    alarm[5] = room_speed * (10/60);
                }
            }
        }
        else 
        {
            if (alarm[7] == -1 && alarm[8] == -1)
            {
                meleeAttack = true;
                alarm[7] = room_speed * (25/60);
            }
        }
    } 
}
   
//Don't walk off tall ledges   
if (!place_meeting(x+(28 * sign(dir)), (y+30), obj_boundary) && !place_meeting(x, (y+1), obj_player) && antiAir == false && jumping == false && !instance_exists(obj_projectile_grenade))
{
    hspd *= 0;
} 

  
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat   
scr_hit_by_bat();

//Hit by a Projectile
scr_hit_by_projectile();

//Collision
scr_collision();
