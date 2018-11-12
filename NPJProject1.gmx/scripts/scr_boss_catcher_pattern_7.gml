//Activate Tractor Beam and Try to Grab Player

//Head and Appendage
weakpoint.hspd = hspd;
weakpoint.vspd = vspd;
//appendage.hspd = hspd;
//appendage.vspd = vspd;

if (shot_timer > 0)
   {
    shot_timer -= room_speed * (1/60);
   }

if (firing == false)
   {
    
    if (step == 3 && destination_established == true)
       {
        appendage.vspd = dir;
       }
    else if (step > 0 && destination_established == true)
       {
        appendage.hspd = dir;
       }
    //show_debug_message("Distance from Destination: " + string(abs(destination - appendage.x)));
    //show_debug_message("HSPD = " + string(hspd) + "    Step = " + string(step) + " Dir = " + string(dir));
   }
else
   {
    appendage.hspd = 0;
    dir = 0;
    if (shot_timer <= 0)
       {
        firing = false;       
       }
    else 
       {
        appendage.vspd = sin((shot_timer/10)) * 12;
       }
   }
if (step == 3)
   {
    if (abs(destination - appendage.y) < 0.6 && firing == false)
       {
        appendage.vspd = 0;
        dir = 0;
        destination_established = false;
        //show_debug_message("Vertical Destination reached for step: " + string(step));
       }
   }
else
   {
    if (abs(destination - appendage.x) < 0.2 && firing == false)
       {
        appendage.hspd = 0;
        dir = 0;
        destination_established = false;
        //show_debug_message("Destination reached for step: " + string(step));
       }
   }
   
if (destination_established == false && firing == false)
   {
    //Extend Arm
    if (step == 0)
       {
        
        destination = x - 180;
        destination_established = true;
        step = 1;
        //show_debug_message("Move Forward! Step = " + string(step) + " Destination = " + string(destination));
       }
    //Raise Arm
    else if (step == 1)
       {
        destination = y-50;
        destination_established = true;
        step = 2;
        //show_debug_message("Move back. Step = " + string(step) + " Destination = " + string(destination));
       }
    //Begin Attack
    else if (step == 2)
       {
        //If player is not on top of the arm...
        if (obj_player.y > appendage.y)
           {
            //Seek them out if they are in range
            if (abs(x - obj_player.x) < 280)
               {
                destination = obj_player.x;
               }
            //Or extend to this point if they are out of range
            else if (abs(x - obj_player.x) >= 280)
               {
                destination = x - 260; 
               }
            destination_established = true;
            step = 3;
           }
        else
           {
            //shake the player off
           }
       }
    else if (step == 3)
       {
        player_caught = false;
        appendage.vspd = 0;
        destination = appendage_position_y+y;
        destination_established = true;
        step = 4;
       }
    else if (step == 4)
       {
        player_caught = false;
        appendage.vspd = 0;
        destination = appendage_position_x+x;
        destination_established = true;
        step = 5;
       }
    else if (step == 5)
       {
        //PatternComplete
        if (appendage.sprite_index != spr_boss_claw_broken)
           {
            appendage.sprite_index = spr_boss_claw;
           }
        state = boss_state.neutral;
       }
    if (step == 3)
       {
        dir = sign(destination - appendage.y);
       }
    else
       {
        dir = sign(destination - appendage.x);
       }
   }
   
//Hit by projectile
scr_boss_hit_by_projectile();

with (weakpoint)
     {
      scr_boss_hit_by_projectile();
     }

   
//Hit by bat
scr_boss_hit_by_bat();

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
   }
     
//Collision
scr_boss_collision();

