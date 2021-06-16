if (hitstun == false)
   {
    hitstun = true;
    hitstun_timer = room_speed * (330/60);
    if (weakpoint.direction > 140)
       {
        weakpoint_switch = false;
        weakpoint.direction -= 90;
       }
    else
       {
        weakpoint_switch = true;
        if (weakpoint.direction < 20)
           {
            weakpoint.direction += 20;
           }
       }
   }
else
   {
    if (hitstun_timer > 0)
       {
        hitstun_timer -= room_speed * (1/60);
       }
    else
       {
        hitstun = false;
        state = boss_state.neutral;
        pattern_selected = true;
        pattern_selector_timer = room_speed * (30/60);
        weakpoint.vulnerable = false;
        weakpoint.state = state;
        //weakpoint.x = x + weakpoint_position_x;
        //weakpoint.y = y + weakpoint_position_y;
        weakpoint.speed = 0;
        weakpoint.direction = 0;
        appendage.state = state;
       }
   }
   
hspd = 0;
vspd = 0;
weakpoint_distance = sqrt(sqr((weakpoint.x-x) - weakpoint_position_x) + sqr((weakpoint.y-y) - weakpoint_position_y));
//weakpoint.direction += weakpoint.weakpoint_hit_path * (weakpoint_distance * 0.2);

               
//show_debug_message("weakpoint direction = " + string(weakpoint.direction));
//show_debug_message("Weakpoint Distance = " + string(weakpoint_distance));
if (weakpoint_switch == true)
   {
    if (weakpoint.direction < 6 || weakpoint.direction > 240)
       {
        show_debug_message("UP: rebound.");
        //weakpoint.direction = point_direction(weakpoint.x,weakpoint.y, x+(2*weakpoint_position_x), y-weakpoint_position_y)
        weakpoint.direction = 180;
        weakpoint_switch = false;
       }
    else
       {
        
        //weakpoint.direction = point_direction(weakpoint.x,weakpoint.y, x, y+weakpoint_position_y)
        target_direction = point_direction(weakpoint.x,weakpoint.y, x+weakpoint_position_x-abs(weakpoint.speed*2), y+weakpoint_position_y-abs(weakpoint.speed*3))
        if (target_direction > 100)
           {
            target_direction = target_direction - 360;
           }
        //target_direction = clamp(target_direction,0,90);
        //show_debug_message("UP: target direction = " + string(target_direction));
        weakpoint.direction = lerp(weakpoint.direction, target_direction, 0.2/*(3/weakpoint.speed)*/);
        //show_debug_message("UP: weakpoint direction = " + string(weakpoint.direction));
        //weakpoint.direction -= room_speed * (5/60);
        
        show_debug_message("UP: weakpoint SPEED = " + string(weakpoint.speed));
       }   
   }
else
   {
    if (weakpoint.direction > 264)
       {
        show_debug_message("DOWN: Rebound.");
        weakpoint.direction = 90;
        weakpoint_switch = true;
       }
    else
       {
        target_direction = point_direction(weakpoint.x,weakpoint.y, x+weakpoint_position_x+abs(weakpoint.speed*3), y+weakpoint_position_y+abs(weakpoint.speed*2));
        if (target_direction < 90)
           {
            target_direction = 350+target_direction;
           }
        //target_direction = clamp(target_direction,0,90);
        //show_debug_message("DOWN: Target Direction = " + string(target_direction));
        weakpoint.direction = lerp(weakpoint.direction, target_direction, 0.2/*(3/weakpoint.speed)*/);
        //show_debug_message("DOWN: Weakpoint Direction = " + string(weakpoint.direction));
        //weakpoint.direction += room_speed * (5/60);
        
        show_debug_message("DOWN: Weakpoint S P E E D = " + string(weakpoint.speed));
       }
   }
if (abs(weakpoint.speed) > 0.2)
   {
    weakpoint.speed -= sign(weakpoint.speed) * room_speed * (0.1/60);
    //weakpoint.speed = weakpoint.speed/weakpoint_distance;
   }
else
   {
    weakpoint.speed = 0;
    if (hitstun_timer > 6)
       {
        hitstun_timer = 5;
       }
   }
with (weakpoint)
     {
      if (hitstun == true)
         {
          //Max Speed
          //weakpoint.speed = abs(weakpoint.speed);
          if (abs(speed) > mxspd)
             {
              //speed = speed/abs(speed) * mxspd;
             }
         }
     }
appendage.hspd = 0;
appendage.vspd = 0;
hp = weakpoint.hp;

//Boss Damage
scr_boss_damage();

//Hit by bat
/*scr_boss_hit_by_bat();

with (weakpoint)
     {
      scr_boss_hit_by_bat();
     }

if (weakpoint.state == boss_state.hitstop)
   {
    saved_shot_timer = shot_timer;
    old_state = state;
    alarm[0] = weakpoint.alarm[0];
    damage_hitstop = weakpoint.damage_hitstop;
    state = boss_state.hitstop;
   }*/
     
//Collision
scr_collision();
