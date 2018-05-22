// Collision

if (place_meeting(x+hspeed,y+vspeed,obj_enemy))
   {
    enemy_struck = instance_place(x+hspeed,y+vspeed,obj_enemy);
    if (enemy_struck != noone)
       {
        /*if (place_meeting(x+hspeed,y,obj_enemy))
           {
            while (!place_meeting(x+sign(hspeed),y,obj_enemy))
                  {
                   x += sign(hspeed);
                  }
           }
        if (place_meeting(x,y+vspeed,obj_enemy))
           {
            while (!place_meeting(x,y+sign(vspeed),obj_enemy))
                  {
                   y += sign(vspeed);
                  }
           }*/

        if (enemy_struck.stopped = true && stopped = false)
           { 
            hp -= 1; 
            enemy_struck.hp -= 1;
            enemy_struck.hit = true;
        
            enemy_struck.speed = speed * 1.5;
            enemy_struck.direction = direction + choose(10, -10, 15, -15)
            /*if (place_meeting(enemy_struck.x+enemy_struck.hspeed,enemy_struck.y,obj_boundary))
               {
                enemy_struck.direction = 180 - enemy_struck.direction;
                show_debug_message("Bounce Horizontal!");
               }
            if (place_meeting(enemy_struck.x,enemy_struck.y+enemy_struck.vspeed,obj_boundary))
               {
                enemy_struck.direction = 360 - enemy_struck.direction;
                show_debug_message("Bounce VERTICAL!");
               }*/
            if (enemy_struck.state != e_state.crash)
               {
                alarm[1] = room_speed * (20/60);
                enemy_struck.hitstun = true;
                
                enemy_struck.state = e_state.hitstun;
               } 
            speed = speed * .6;
            direction += choose(5, -5, 10, -10);
            /*if (place_meeting(x,y+sign(vspeed),obj_boundary))
               {
                if (direction > 180 && direction < 360)
                   {
                    direction = -direction;
                   }
               }*/
           }
       }
   }
