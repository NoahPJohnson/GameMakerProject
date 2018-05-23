// Collision

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
                enemy_struck.hp -= 1;
                enemy_struck.speed = (speed * 1.5)+3;
                enemy_struck.direction = direction + choose(10, -10, 15, -15);
                with (enemy_struck)
                     {
                      scr_collision_bounce();
                     }
                enemy_struck.alarm[1] = room_speed * (30/60);
                enemy_struck.hitstun = true;
                enemy_struck.state = e_state.hitstun;
               }
           }
        if (place_meeting(x+hspeed,y,obj_enemy))
           {
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
            if (colliding_object.state != e_state.crash)
               {
                incidence = direction;
     
                new_dir = 180 - incidence;
                if (new_dir < 0)
                   {
                    new_dir += 360;
                   }
                direction = new_dir;
                speed *= .5;
               }
           }
        if (place_meeting(x,y+vspeed,obj_enemy))
           {
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
            if (colliding_object.state != e_state.crash)
               {
                incidence = direction;
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
                   }
               }
           }
       }
   }
