// Collision
/*if (place_meeting(x,y,obj_enemy))
   {
    show_debug_message("Clipping in enemy collision hitstun FIRST! This is: " + object_get_name(object_index));
   }*/
   
   
if (place_meeting(x+hspeed,y+vspeed,obj_enemy))
   {
    enemy_struck = instance_place(x+hspeed,y+vspeed,obj_enemy);
    if (enemy_struck != noone)
       {
        if (enemy_struck.stopped = true && stopped = false)
           { 
            if (enemy_struck.state != e_state.crash)
               {
                hp -= 1;
                scr_enemy_hp_zero();
                enemy_struck.hp -= 1;
                //Update the score!
                if (enemy_struck.hp < 1)
                   {
                    scr_score_tracker_script_run(1, true, (enemy_struck.state == e_state.crash));
                   }
                else
                   {
                    scr_score_tracker_script_run(1, false, (enemy_struck.state == e_state.crash)); 
                   }
                with (enemy_struck)
                     {
                      scr_enemy_hp_zero();
                     }
                enemy_struck.hitstun_direction = direction + choose(10, -10, 15, -15);
                enemy_struck.old_speed = (speed * 1.5)+3;
                enemy_struck.impetus = 0;
                enemy_struck.hitdir = 1; 
                enemy_struck.old_state = enemy_struck.state;
                enemy_struck.alarm[7] = -1;
                enemy_struck.alarm[9] = room_speed * (3/60);
                enemy_struck.damage_hitstop = true;

                enemy_struck.state = e_state.hitstop;
                //show_debug_message("Hit enemy, do damage.");
                /*enemy_struck.speed = (speed * 1.5)+3;
                enemy_struck.direction = direction + choose(10, -10, 15, -15);
                with (enemy_struck)
                     {
                      scr_collision_bounce();
                     }
                enemy_struck.alarm[1] = room_speed * (30/60);
                enemy_struck.hitstun = true;
                enemy_struck.state = e_state.hitstun;*/
               }
           
        if (place_meeting(x+hspeed,y,obj_enemy))
           {
            //show_debug_message("Hey. H " + string(id));
            /*while (!place_meeting(x+sign(hspeed),y,obj_enemy))
                  {
                   if (sign(hspeed) == 1)
                      {
                       x += 1;
                      }
                   else if (sign(hspeed) == -1)
                      {
                       x -= 1;
                      }
                  }*/
            colliding_object = instance_place(x+hspeed,y,obj_enemy);
            //show_debug_message("colliding H object is: " + object_get_name(colliding_object.object_index) + " I am " + object_get_name(object_index));
            if (colliding_object.state != e_state.crash)
               {
                //show_debug_message("colliding object isn't crash H");
                incidence = direction;
                new_dir = 180 - incidence;
                if (new_dir < 0)
                   {
                    new_dir += 360;
                   }
                hitstun_direction = new_dir;
                old_speed = speed * .5;
                impetus = 0;
                hitdir = 1; 
                old_state = state;
                alarm[7] = -1;
                alarm[9] = room_speed * (3/60);
                damage_hitstop = true;
                speed = 0;
                state = e_state.hitstop;
                //show_debug_message("H this object's state is " + string(state) + " damage hitstop = " + string(damage_hitstop));
                /*incidence = direction;
     
                new_dir = 180 - incidence;
                if (new_dir < 0)
                   {
                    new_dir += 360;
                   }
                direction = new_dir;
                speed *= .5;*/
               }
           }
        if (place_meeting(x,y+vspeed,obj_enemy))
           {
            //show_debug_message("Hey. V " + string(id));
            /*while (!place_meeting(x,y+sign(vspeed),obj_enemy))
                  {
                   if (sign(vspeed) == 1)
                      {
                       y += 1;
                      }
                   else if (sign(vspeed) == -1)
                      {
                       y -= 1;
                      }
                  }*/
            colliding_object = instance_place(x,y+vspeed,obj_enemy);
            //show_debug_message("colliding V object is: " + object_get_name(colliding_object.object_index) + " my name is " + object_get_name(object_index));
            if (colliding_object.state != e_state.crash)
               {
                //show_debug_message("colliding object isn't crash V");
                incidence = direction;
                new_dir = 360 - incidence;
                if (new_dir < 0)
                   {
                    new_dir += 360;
                   }
                hitstun_direction = new_dir;
                if (speed > 2)
                   {
                    old_speed = speed * 5;
                   }
                else
                   {
                    old_speed = 0;
                   }
                impetus = 0;
                hitdir = 1; 
                old_state = state;
                alarm[7] = -1;
                alarm[9] = room_speed * (3/60);
                damage_hitstop = true;
                speed = 0;
                state = e_state.hitstop; 
                //show_debug_message("V this object's state is " + string(state) + " damage hitstop = " + string(damage_hitstop));
                /*incidence = direction;
                new_dir = 360 - incidence;
                if (new_dir < 0)
                   {
                    new_dir += 360;
                   }
                direction = new_dir;
                if (speed > 2)
                   {
                    speed *= .5; 
                   }
                else
                   {
                    speed = 0;
                   }*/
               }
           }
        
        
        /*if (place_meeting(x,y,obj_enemy))
           {
            show_debug_message("Clipping in enemy collision hitstun after. This is: " + object_get_name(object_index));
           }*/
           
           
           }
        //show_debug_message("Final this object's state is " + string(state) + " damage hitstop = " + string(damage_hitstop));
       }
   }
