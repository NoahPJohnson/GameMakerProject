// Collision
enemy_struck = instance_place(x+vspeed,y+hspeed,obj_enemy);

if (enemy_struck != noone)
   {
    //while (!place_meeting(x+sign(hspeed),y,obj_enemy))
    //      {
           //x += sign(hspeed);
    //      } 
    if (enemy_struck.stopped = true && stopped = false)
       { 
        hp -= 1; 
        enemy_struck.hp -= 1;
        enemy_struck.hit = true;
        enemy_struck.speed = speed * 1.5;
        enemy_struck.direction = direction + choose(10, -10, 15, -15)
        if (place_meeting(enemy_struck.x,enemy_struck.y+sign(enemy_struck.vspeed),obj_boundary))
           {
            if (sign(enemy_struck.vspeed) > 0 && enemy_struck.direction > 180 && enemy_struck.direction < 360)
               {
                enemy_struck.direction = -enemy_struck.direction;
               }
           }
        if (enemy_struck.state != e_state.crash)
           {
            enemy_struck.state = e_state.hitstun;
           } 
        speed = speed * .7;
        direction += choose(5, -5, 10, -10);
        if (place_meeting(x,y+sign(vspeed),obj_boundary))
           {
            if (sign(vspeed) > 0 && direction > 180 && direction < 360)
               {
                direction = -direction;
               }
           }
       }
   }
